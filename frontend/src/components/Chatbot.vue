<template>
    <div class="chatbot-icon" @click="toggleChatBot">
        <img :src="chatbotIcon" alt="Chatbot Icon" height="45" width="45" />
    </div>

    <div class="chatbox" v-if="showChatBot">
        <div class="chat-window">
            <h3>How mahyh I help?</h3>
            <div class="chat-messages" ref="messageContainer">
                <div v-for="(message, index) in messages" :key="index" :class="{
                    'user-message': message.sender === 'user',
                    'bot-message': message.sender === 'bot'
                }">
                    <strong>{{ message.sender === 'user' ? 'You' : 'Bot' }}:</strong>
                    <p>{{ message.text }}</p>
                </div>
            </div>
        </div>

        <div class="chat-input">
            <input type="text" v-model="userInput" placeholder="Type a message..." @keydown.enter="sendMessage"
                :disabled="isLoading" />
            <button @click="sendMessage" :disabled="isLoading">Send</button>
        </div>
    </div>
</template>

<script>
export default {
    name: "Chatbot",
    data() {
        return {
            userInput: "",
            messages: [],
            chatbotIcon: new URL("@/assets/chatbot.png", import.meta.url).href,
            showChatBot: false,
            isLoading: false,
        };
    },
    methods: {
        toggleChatBot() {
            this.showChatBot = !this.showChatBot;
        },

        sendMessage() {
            if (this.userInput.trim()) {
                this.messages.push({ sender: "user", text: this.userInput });

                const userMessage = this.userInput;
                this.userInput = "";
                this.isLoading = true;

                this.getBotResponse(userMessage);
            }
        },

        async getBotResponse(userMessage) {
            try {
                const response = await fetch("http://localhost/smg/backend/api/chatbot.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ message: userMessage }),
                });

                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }

                const data = await response.json();
                const botResponse = data.response || "Sorry, I couldn't get a response.";

                if (botResponse === "This message contains inappropriate content.") {
                    this.messages.push({
                        sender: "bot",
                        text: "Sorry, your message was flagged as inappropriate. Please rephrase it.",
                    });
                } else {
                    this.messages.push({ sender: "bot", text: botResponse });
                }

            } catch (error) {
                console.error("Error:", error);
                this.messages.push({ sender: "bot", text: "Sorry, something went wrong." });
            } finally {
                this.isLoading = false;
                this.scrollToBottom();
            }
        },

        scrollToBottom() {
            const container = this.$refs.messageContainer;
            container.scrollTop = container.scrollHeight;
        },
    },
    watch: {
        messages() {
            this.$nextTick(() => {
                this.scrollToBottom();
            });
        },
    },
};
</script>

<style scoped>
.chatbot-icon {
    z-index: 99;
    position: fixed;
    bottom: 20px;
    right: 20px;
    border-radius: 50%;
    height: 50px;
    width: 50px;
    border: 2px solid #2e2e2e;
    cursor: pointer;
    background: #40a315;
}

.chatbox {
    position: fixed;
    bottom: 80px;
    right: 20px;
    max-width: 300px;
    width: 100%;
    margin: 0 auto;
    border: 1px solid #ccc;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.chat-window {
    padding: 10px;
    max-height: 400px;
    overflow-y: auto;
    flex-grow: 1;
}

.chat-messages {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.user-message p {
    background-color: #e0f7fa;
    padding: 5px;
    border-radius: 5px;
}

.bot-message p {
    background-color: #f1f0f0;
    padding: 5px;
    border-radius: 5px;
}

.chat-input {
    display: flex;
    padding: 10px;
    border-top: 1px solid #ccc;
}

.chat-input input {
    flex-grow: 1;
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ccc;
    background-color: #FFFFFF;
}

.chat-input button {
    padding: 8px 12px;
    margin-left: 8px;
    border: none;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    cursor: pointer;
}

.chat-input button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}

.chat-input button:hover:not(:disabled) {
    background-color: #0056b3;
}
</style>
