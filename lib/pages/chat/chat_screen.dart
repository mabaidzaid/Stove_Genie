import 'package:flutter/material.dart';
//import '../../services/gemini_api_service.dart';
import '../../models/message_model.dart';
import 'package:stove_genie/utils/colors.dart';
import '../../services/groq_api_service.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final GroqAPIService _apiService = GroqAPIService(); 

  final List<Message> _messages = [];
  bool _isTyping = false;

  void _sendMessage() async {
    String input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      _messages.add(Message(text: input, isUser: true));
      _controller.clear();
      _isTyping = true;
    });

    String botReply = await _apiService.getGroqReply(input);

    setState(() {
      _messages.add(Message(text: botReply, isUser: false));
      _isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          
          children: [
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
  child: Row(
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context); // Navigate back to homepage
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.buttonColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: AppColors.buttonColor),
        ),
      ),
      const SizedBox(width: 10),
      const Text(
        "Genie AI",
        style: TextStyle(
          color: AppColors.buttonColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

            Expanded(
              child: _messages.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "What would you like to Eat Today?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 173, 168, 168),
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: _messages.length + (_isTyping ? 1 : 0),
                      itemBuilder: (_, index) {
                        if (_isTyping && index == _messages.length) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              padding: const EdgeInsets.all(14),
                              constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width *
                                      0.75),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: const TypingDots(),
                            ),
                          );
                        }

                        final message = _messages[index];
                        final isUser = message.isUser;

                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            padding: const EdgeInsets.all(14),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75),
                            decoration: BoxDecoration(
                              color: isUser
                                  ? AppColors.buttonColor
                                  : Colors.orange.shade100,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft:
                                    Radius.circular(isUser ? 16 : 0),
                                bottomRight:
                                    Radius.circular(isUser ? 0 : 16),
                              ),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: isUser ? Colors.white : Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Ask Genie...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.buttonColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🟠 TYPING DOTS WIDGET
class TypingDots extends StatefulWidget {
  const TypingDots({super.key});

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _animation1 = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.6, curve: Curves.easeInOut)),
    );
    _animation2 = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.8, curve: Curves.easeInOut)),
    );
    _animation3 = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 1.0, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _dot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(_animation1),
        _dot(_animation2),
        _dot(_animation3),
      ],
    );
  }
}
