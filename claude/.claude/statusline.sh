#!/bin/bash

# Claude Code statusline — enhanced edition
# Layout: user  folder  ⎇ branch ↑1 ●2 ·3  Sonnet 4.6 ████░░░░ 42%  15:30

INPUT=$(cat)

# ── 256-color palette ────────────────────────────────────────────────────────
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"

C_USER="\033[38;5;75m"      # blue   — username
C_MODEL="\033[38;5;141m"    # purple — model name
C_FOLDER="\033[38;5;87m"    # cyan   — folder
C_BRANCH="\033[38;5;215m"   # orange — branch name
C_CLEAN="\033[38;5;114m"    # green  — clean repo / low ctx
C_WARN="\033[38;5;221m"     # yellow — dirty repo / mid ctx
C_HOT="\033[38;5;203m"      # red    — high ctx / deletions
C_AHEAD="\033[38;5;114m"    # green  — ahead of remote
C_BEHIND="\033[38;5;203m"   # red    — behind remote
C_STAGED="\033[38;5;221m"   # yellow — staged
C_UNSTAGED="\033[38;5;215m" # orange — unstaged
C_UNTRACK="\033[38;5;245m"  # gray   — untracked
C_TIME="\033[38;5;245m"     # gray   — time
C_SEP="\033[97m"             # bright white — separators

SEP="${C_SEP} | ${RESET}"

# ── Static fields ─────────────────────────────────────────────────────────────
CURRENT_USER=$(whoami)
NOW=$(date +"%-H:%M")
WORKDIR=$(echo "$INPUT" | jq -r '.workspace.current_dir // empty')
FOLDER=$(basename "$WORKDIR" 2>/dev/null)

# Model: strip "Claude " prefix so "Claude Sonnet 4.6" → "Sonnet 4.6"
MODEL_RAW=$(echo "$INPUT" | jq -r '.model.display_name // .model.name // empty')
MODEL=$(echo "$MODEL_RAW" | sed 's/^[Cc]laude[[:space:]]*//')

# ── Git section ───────────────────────────────────────────────────────────────
GIT_SECTION=""
GIT_ROOT=$(git -C "$WORKDIR" rev-parse --show-toplevel --no-optional-locks 2>/dev/null)

if [ -n "$GIT_ROOT" ]; then
  BRANCH=$(git -C "$GIT_ROOT" symbolic-ref --short HEAD 2>/dev/null)

  # Ahead / behind remote
  AHEAD=0; BEHIND=0
  UPSTREAM=$(git -C "$GIT_ROOT" rev-parse --abbrev-ref "@{upstream}" 2>/dev/null)
  if [ -n "$UPSTREAM" ]; then
    AHEAD=$(git  -C "$GIT_ROOT" rev-list --count "@{upstream}..HEAD"  --no-optional-locks 2>/dev/null || echo 0)
    BEHIND=$(git -C "$GIT_ROOT" rev-list --count "HEAD..@{upstream}"  --no-optional-locks 2>/dev/null || echo 0)
  fi

  # Staged / unstaged / untracked
  STAGED=0; UNSTAGED=0; UNTRACKED=0
  while IFS= read -r line; do
    X="${line:0:1}"; Y="${line:1:1}"
    [ "$X" != " " ] && [ "$X" != "?" ] && STAGED=$((STAGED+1))
    { [ "$Y" = "M" ] || [ "$Y" = "D" ]; } && UNSTAGED=$((UNSTAGED+1))
    [ "$X" = "?" ] && UNTRACKED=$((UNTRACKED+1))
  done < <(git -C "$GIT_ROOT" status --porcelain --no-optional-locks 2>/dev/null)

  DIRTY=$((STAGED + UNSTAGED + UNTRACKED))

  # Branch: green when clean, yellow when dirty
  [ "$DIRTY" -eq 0 ] && BC="$C_CLEAN" || BC="$C_WARN"
  GIT_SECTION="${BC}⎇ ${BRANCH}${RESET}"

  # Badges
  [ "$AHEAD"    -gt 0 ] && GIT_SECTION="${GIT_SECTION} ${C_AHEAD}↑${AHEAD}${RESET}"
  [ "$BEHIND"   -gt 0 ] && GIT_SECTION="${GIT_SECTION} ${C_BEHIND}↓${BEHIND}${RESET}"
  [ "$STAGED"   -gt 0 ] && GIT_SECTION="${GIT_SECTION} ${C_STAGED}●${STAGED}${RESET}"
  [ "$UNSTAGED" -gt 0 ] && GIT_SECTION="${GIT_SECTION} ${C_UNSTAGED}·${UNSTAGED}${RESET}"
  [ "$UNTRACKED"-gt 0 ] && GIT_SECTION="${GIT_SECTION} ${C_UNTRACK}?${UNTRACKED}${RESET}"
fi

# ── Context bar ───────────────────────────────────────────────────────────────
CTX_DISPLAY=""
PCT_USED=$(echo "$INPUT" | jq -r '.context_window.used_percentage // empty')

if [ -n "$PCT_USED" ]; then
  PCT_INT=$(printf "%.0f" "$PCT_USED")
  FILLED=$(( PCT_INT * 8 / 100 ))
  [ "$FILLED" -gt 8 ] && FILLED=8
  EMPTY=$(( 8 - FILLED ))

  # 8-block bar
  BAR=""
  i=0
  while [ $i -lt 8 ]; do
    [ $i -lt "$FILLED" ] && BAR="${BAR}█" || BAR="${BAR}░"
    i=$((i+1))
  done

  # Color by usage
  if   [ "$PCT_INT" -le 50 ]; then CC="$C_CLEAN"
  elif [ "$PCT_INT" -le 80 ]; then CC="$C_WARN"
  else CC="$C_HOT"
  fi

  if [ -n "$MODEL" ]; then
    CTX_DISPLAY="${C_MODEL}${MODEL}${RESET} ${CC}${BAR}${RESET} ${C_TIME}${PCT_INT}%${RESET}"
  else
    CTX_DISPLAY="${CC}${BAR}${RESET} ${C_TIME}${PCT_INT}%${RESET}"
  fi
fi

# ── Assemble ──────────────────────────────────────────────────────────────────
PARTS=()
[ -n "$CURRENT_USER" ] && PARTS+=("${C_USER}${BOLD}${CURRENT_USER}${RESET}")
[ -n "$FOLDER"        ] && PARTS+=("${C_FOLDER}${FOLDER}${RESET}")
[ -n "$GIT_SECTION"   ] && PARTS+=("${GIT_SECTION}")
[ -n "$CTX_DISPLAY"   ] && PARTS+=("${CTX_DISPLAY}")
[ -n "$NOW"           ] && PARTS+=("${C_TIME}${NOW}${RESET}")

OUTPUT=""
for part in "${PARTS[@]}"; do
  [ -z "$OUTPUT" ] && OUTPUT="$part" || OUTPUT="${OUTPUT}${SEP}${part}"
done

printf "%b\n" "${OUTPUT}${RESET}"
