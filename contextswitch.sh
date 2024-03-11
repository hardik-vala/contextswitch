#!/bin/bash

usage() {
    echo "Usage: $0 --context <value>"
    echo "Options:"
    echo "  --Context    Name of context (e.g. weekly_debrief)"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

context=""

# Loop through the command-line arguments.
while [[ $# -gt 0 ]]; do
    case "$1" in
        --context)
            context="$2"
            shift 2
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

case "$context" in
    weekly_debrief)
        LINKS=(
            "/Applications/Google\ Chrome.app https://www.figma.com/file/8XvGZ8tB8h59I67Bzyvb69/Hub?type=whiteboard&node-id=867-516&t=vPCDWmZV0NIVNNLJ-0"
            "/Applications/Obsidian.app obsidian://open?vault=KMS&file=Entrepreneurship%2FStartups%2F-1%20-%3E%200%2FWeekly%20Debrief"
        )
        ;;
    *)
        echo "ERROR: Do not recognize context: $context"
        ;;
esac

for link in "${LINKS[@]}"; do
    read app uri <<< "$link"
    open -a "$app" "$uri"
done
