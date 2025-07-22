import 'package:flutter/material.dart';

class TextInputWithButton extends StatelessWidget {
  const TextInputWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Say Something...',
                      hintStyle: TextStyle(color: Color(0xFFD9D9D9)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), 
            Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFFFA307),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}
