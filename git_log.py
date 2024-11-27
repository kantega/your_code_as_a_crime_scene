import subprocess
import sys

def fetch_git_log():
    """Fetch the Git log with file names."""
    try:
        # Run the git log command
        result = subprocess.run(
            ["git", "log", "--numstat","--date=short", "--pretty=format:'--%h--%ad--%aN'"],
            capture_output=True,
            text=True,
            check=True
        )
        # Split the output into lines
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error fetching Git log: {e.stderr}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    fetch_git_log()