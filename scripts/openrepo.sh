#!/bin/bash

# Function to extract and open the repository URL in the browser
open_repo_in_browser() {

    # Check if an argument is supplied
    if [ -z "$1" ]; then
        head="HEAD"
    else
        head="HEAD~$1"
    fi

    # Get the current directory's repository remote URL
    remote_url=$(git config --get remote.origin.url)

    if [ -z "$remote_url" ]; then
        echo "No remote repository found in the current directory."
        return 1
    fi
    # Convert SSH URLs to HTTPS (if applicable)
    if [[ "$remote_url" == git@* ]]; then
        remote_url=$(echo "$remote_url" | sed -E 's/git@(.*):(.*)\.git/https:\/\/\1\/\2/')
    elif [[ "$remote_url" == http* ]]; then
        remote_url=$(echo "$remote_url" | sed -E 's/\.git$//' | sed 's|/a/|/plugins/gitiles/|g')
    elif [[ "$remote_url" == ssh:* ]]; then
        remote_url=$(echo "$remote_url" | sed -E 's|ssh:|https:|' \
    | sed -E 's|-ssh||' \
    | sed -E 's|\.net|\.biz/plugins/gitiles|')
    else
        echo "Unsupported URL format: $remote_url"
        return 1
    fi
    
    if [[ "$remote_url" == *replica* ]]; then
        remote_url=$(format_replica "$remote_url")
    fi

    remote_url=$(append_location "$remote_url" "$head")
    echo "Opening $remote_url in your browser..."
    # Open the repository in the default browser
    xdg-open "$remote_url" 2>/dev/null || open "$remote_url" || echo "Unable to open browser."
    echo
}

format_replica() {
    local url="$1"
    url="${url/-replica[^v]*.volvocars/.volvocars}"
    # Remove the colon and numbers after "gitiles:"
    url=$(echo "$url" | sed -E 's/(gitiles):[0-9]+/\1/')
    echo "$url"
}

append_location() {
    rel_path=$(git rev-parse --show-prefix)
    commit=$(git rev-parse "$2")
    local link="$1/+/$commit/$rel_path"
    echo "$link"
}

# Create an alias for convenience
alias openrepo="open_repo_in_browser"

# Allow running the function directly if sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    open_repo_in_browser
fi
