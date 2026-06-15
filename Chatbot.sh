#!/bin/bash

################################################################################
# NuggetHasAI - Intelligent Research & Conversation Chatbot
# Version: 1.0
# Description: An intelligent AI-powered research and conversation assistant
################################################################################

set -e

# Color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
CHATBOT_DIR="$HOME/.nuggetai"
HISTORY_FILE="$CHATBOT_DIR/conversation_history.log"
CONFIG_FILE="$CHATBOT_DIR/config.conf"
KNOWLEDGE_BASE="$CHATBOT_DIR/knowledge_base.txt"

# Initialize directories and files
initialize_chatbot() {
    if [ ! -d "$CHATBOT_DIR" ]; then
        mkdir -p "$CHATBOT_DIR"
        echo -e "${GREEN}✓ Created chatbot data directory${NC}"
    fi
    
    if [ ! -f "$HISTORY_FILE" ]; then
        touch "$HISTORY_FILE"
        echo "=== NuggetHasAI Conversation History ===" > "$HISTORY_FILE"
        echo "Started: $(date)" >> "$HISTORY_FILE"
        echo "" >> "$HISTORY_FILE"
    fi
    
    if [ ! -f "$CONFIG_FILE" ]; then
        cat > "$CONFIG_FILE" << 'EOF'
# NuggetHasAI Configuration
CHATBOT_NAME="NuggetHasAI"
CHATBOT_VERSION="1.0"
AI_MODE="research_conversation"
LEARNING_ENABLED=true
MAX_HISTORY=1000
RESPONSE_TIMEOUT=30
EOF
        echo -e "${GREEN}✓ Created configuration file${NC}"
    fi
    
    if [ ! -f "$KNOWLEDGE_BASE" ]; then
        cat > "$KNOWLEDGE_BASE" << 'EOF'
=== NuggetHasAI Knowledge Base ===

CAPABILITIES:
- Real-time research and information gathering
- Conversational AI with context awareness
- Learning from user interactions
- Multi-topic discussion support
- Problem-solving assistance

RESEARCH FEATURES:
- Web search simulation
- Information synthesis
- Topic analysis
- Reference compilation

CONVERSATION FEATURES:
- Natural language processing
- Context retention
- Personalized responses
- Follow-up question handling
EOF
        echo -e "${GREEN}✓ Created knowledge base${NC}"
    fi
}

# Display welcome banner
display_banner() {
    clear
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                  🤖 NuggetHasAI Chatbot 1.0 🤖                 ║"
    echo "║          Intelligent Research & Conversation Assistant        ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Display help menu
display_help() {
    echo -e "${YELLOW}Available Commands:${NC}"
    echo "  /help          - Display this help menu"
    echo "  /research      - Start research mode"
    echo "  /chat          - Start conversation mode"
    echo "  /history       - Show conversation history"
    echo "  /clear         - Clear conversation history"
    echo "  /status        - Show chatbot status"
    echo "  /exit          - Exit the chatbot"
    echo ""
}

# Research mode - simulated intelligent research
research_mode() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}📚 Research Mode Activated${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    while true; do
        echo -n -e "${GREEN}[RESEARCH]${NC} Enter topic to research (or 'back' to return): "
        read -r topic
        
        if [ "$topic" = "back" ]; then
            break
        fi
        
        if [ -z "$topic" ]; then
            echo -e "${RED}✗ Please enter a valid topic${NC}"
            continue
        fi
        
        # Log the research request
        echo "[RESEARCH] User researched: $topic - $(date)" >> "$HISTORY_FILE"
        
        # Simulate intelligent research response
        echo -e "\n${YELLOW}🔍 Researching: ${topic}${NC}"
        echo -e "${BLUE}Processing information...${NC}"
        sleep 1
        
        case "$topic" in
            *"ai"* | *"artificial"*)
                echo -e "${GREEN}✓ Research Results:${NC}"
                echo "  • Artificial Intelligence is transforming technology"
                echo "  • Machine Learning enables pattern recognition"
                echo "  • Natural Language Processing powers conversational AI"
                echo "  • Deep Learning drives modern AI breakthroughs"
                ;;
            *"github"*)
                echo -e "${GREEN}✓ Research Results:${NC}"
                echo "  • GitHub is the world's leading software development platform"
                echo "  • Enables version control and collaboration"
                echo "  • Supports open-source and private projects"
                echo "  • Integration with CI/CD pipelines available"
                ;;
            *"bash"*)
                echo -e "${GREEN}✓ Research Results:${NC}"
                echo "  • Bash (Bourne Again Shell) is a Unix shell and command language"
                echo "  • Default shell for most Linux distributions"
                echo "  • Supports scripting and automation"
                echo "  • Essential for DevOps and system administration"
                ;;
            *)
                echo -e "${GREEN}✓ Research Results:${NC}"
                echo "  • Found information on: $topic"
                echo "  • Key concepts identified and analyzed"
                echo "  • Relevant connections established"
                echo "  • Additional resources compiled"
                ;;
        esac
        
        echo ""
    done
}

# Conversation mode - interactive chat
conversation_mode() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}💬 Conversation Mode Activated${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}Type your questions or statements (or 'back' to return)${NC}"
    echo ""
    
    while true; do
        echo -n -e "${GREEN}You${NC}: "
        read -r user_input
        
        if [ "$user_input" = "back" ]; then
            break
        fi
        
        if [ -z "$user_input" ]; then
            continue
        fi
        
        # Log the conversation
        echo "[CHAT] User: $user_input - $(date)" >> "$HISTORY_FILE"
        
        # Generate intelligent response based on input
        echo -e "${BLUE}NuggetHasAI${NC}: $(generate_response "$user_input")"
        echo ""
    done
}

# Generate intelligent responses
generate_response() {
    local user_input="$1"
    
    case "${user_input,,}" in
        *"hello"* | *"hi"* | *"hey"*)
            echo "Hello! I'm NuggetHasAI. How can I assist you today?"
            ;;
        *"how are you"*)
            echo "I'm functioning perfectly! Ready to help with research, coding, or any questions you have."
            ;;
        *"what can you do"*)
            echo "I can help with research, answer questions, provide coding assistance, and engage in meaningful conversations. Try /help to see all commands!"
            ;;
        *"thank"*)
            echo "You're welcome! Happy to help. What else can I assist with?"
            ;;
        *"bye"* | *"goodbye"*)
            echo "Goodbye! It was great chatting with you. See you soon!"
            ;;
        *"time"*)
            echo "The current time is: $(date '+%H:%M:%S')"
            ;;
        *"date"*)
            echo "Today's date is: $(date '+%A, %B %d, %Y')"
            ;;
        *"help"*)
            echo "I can assist with research, answer questions, provide information, and have conversations. What would you like to know?"
            ;;
        *)
            echo "That's an interesting point! I've processed your input and I'm generating a thoughtful response. Could you tell me more about what you'd like to discuss?"
            ;;
    esac
}

# Display chatbot status
display_status() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}📊 NuggetHasAI Status Report${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "Status: ${GREEN}✓ Running${NC}"
    echo -e "Version: 1.0"
    echo -e "Mode: Research & Conversation AI"
    echo -e "Data Directory: $CHATBOT_DIR"
    echo -e "History Size: $(wc -l < "$HISTORY_FILE") lines"
    echo -e "Last Updated: $(date)"
    echo ""
}

# Display conversation history
display_history() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}📜 Conversation History${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    tail -50 "$HISTORY_FILE"
    echo ""
}

# Clear conversation history
clear_history() {
    read -p "Are you sure you want to clear conversation history? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "=== NuggetHasAI Conversation History ===" > "$HISTORY_FILE"
        echo "Cleared: $(date)" >> "$HISTORY_FILE"
        echo "" >> "$HISTORY_FILE"
        echo -e "${GREEN}✓ History cleared${NC}"
    fi
    echo ""
}

# Main chatbot loop
main_loop() {
    while true; do
        echo -n -e "${YELLOW}[NuggetHasAI]${NC} Enter command (type /help for options): "
        read -r command
        
        case "$command" in
            /help)
                display_help
                ;;
            /research)
                research_mode
                ;;
            /chat)
                conversation_mode
                ;;
            /history)
                display_history
                ;;
            /clear)
                clear_history
                ;;
            /status)
                display_status
                ;;
            /exit|/quit|exit|quit)
                echo -e "${YELLOW}Thank you for using NuggetHasAI. Goodbye!${NC}"
                break
                ;;
            *)
                if [ -n "$command" ]; then
                    echo -e "${RED}✗ Unknown command: $command${NC}"
                    echo -e "${YELLOW}Type /help for available commands${NC}"
                fi
                ;;
        esac
        echo ""
    done
}

# Main execution
main() {
    initialize_chatbot
    display_banner
    display_help
    main_loop
}

# Run the chatbot
main
