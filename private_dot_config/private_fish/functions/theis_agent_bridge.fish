# Roughly translated from https://www.rebelpeon.com/bitwarden-ssh-agent-on-wsl2/

function theis_agent_bridge
  if test -z "$SSH_AUTH_SOCK"
      set -Ux SSH_AUTH_SOCK $HOME/.ssh/agent.sock
  end

  if not test -S "$SSH_AUTH_SOCK"
    rm -f "$SSH_AUTH_SOCK"
    setsid socat \
      "UNIX-LISTEN:$SSH_AUTH_SOCK,fork" \
      "EXEC:npiperelay.exe -ei -s //./pipe/openssh-ssh-agent,nofork" \
      >/dev/null 2>&1 &
  end
end
