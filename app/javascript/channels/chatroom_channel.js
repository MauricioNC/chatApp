import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatroomChannel", room: "Chat room" }, {
  connected() {
  },

  disconnected() {
  },

  received(data) {
  }
});
