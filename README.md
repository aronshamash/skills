# AI Coding Assistant Skills

Personal collection of skills for AI coding assistants (Claude Code, Copilot, Cursor, etc.).

## Skills

### grill-me

Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree.

**Use when:** You want to stress-test a plan, get grilled on your design, or need help thinking through a complex decision tree.

**Invocation:**
```bash
/grill-me
```

## Installation

### Claude Code

```bash
git clone https://github.com/aronshamash/skills.git ~/repos/skills
cd ~/repos/skills
./install.sh
```

Or install individual skills:

```bash
ln -sf ~/repos/skills/grill-me ~/.claude/skills/grill-me
```

### Other AI Assistants

Check your assistant's documentation for skills directory location and format.

## License

MIT
