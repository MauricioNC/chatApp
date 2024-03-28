import consumer from "channels/consumer"

let room = document.querySelector("[data-room]")

consumer.subscriptions.create({ channel: "ChatroomChannel", room: room.dataset.room }, {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const conversation = document.getElementById("conversation")
    const messageElement = document.createElement("p")
    messageElement.textContent = data.body
    conversation.appendChild(messageElement)
  }
});
