import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
      isRead: true,
      time: '',
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.video_call,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.call,color: Colors.black,)),
          PopupMenuButton(
              color: Colors.black,
              itemBuilder: (context) => const [
                    PopupMenuItem(
                        value: 1,
                        child: Text(
                          'group',
                          style: TextStyle(color: Colors.white),
                        )),
                    PopupMenuItem(
                        value: '2',
                        child: Text(
                          'Settings',
                          style: TextStyle(color: Colors.white),
                        )),
                    PopupMenuItem(
                        value: '3',
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        )),
                  ]),


        ],

        title: const CircleAvatar(
          backgroundImage: NetworkImage('https://images.pexels.com/photos/1031081/pexels-photo-1031081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
          ),
        ),
leading: IconButton(
  icon: const Icon(Icons.arrow_back,color: Colors.black,), // Customize the back button icon here
  onPressed: () {
    // Handle the back button press here
  },
),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            const Icon(
              Icons.attach_file,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.orange,
              ),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool isRead;
  final String time;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.isUser,
      required this.isRead,
      required this.time});

  @override
  Widget build(BuildContext context) {
    // Define the background color for user and other user messages
    Color? messageBackgroundColor =
        isUser ? const Color(0xffF1B053) : Colors.grey[300];

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(
                      10.0), // Add padding for the message box
                  decoration: BoxDecoration(
                    color: messageBackgroundColor, // Set the background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add rounded corners
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      if (isRead)
                        const Icon(Icons.done_all,
                            size: 16.0,
                            color: Colors.blue), // Display the read tick
                      if (!isRead)
                        const Icon(Icons.done,
                            size: 16.0,
                            color: Colors.grey), // Display the unread tick
                    ],

                    // Text color is black
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
