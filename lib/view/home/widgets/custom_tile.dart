import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? avatarInitial;
  final String? time;
  final bool isUnread;
  final VoidCallback onTap;
  final Widget? trailing;

  const CustomTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.avatarInitial,
    this.time,
    this.isUnread = false,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(158, 158, 158, 0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            /// Circle Avatar
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                avatarInitial ?? '?',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(width: 16),

            /// Chat name and message preview
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // Time and unread indicator
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (time != null)
                  Text(
                    time!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                  ),
                SizedBox(height: 5),
                if (isUnread)
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.greenAccent],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.greenAccent, blurRadius: 4),
                      ],
                    ),
                  ),
              ],
            ),

            // Optional widget
            if (trailing != null) ...[SizedBox(width: 8), trailing!],
          ],
        ),
      ),
    );
  }
}
