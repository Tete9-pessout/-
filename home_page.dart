import 'package:flutter/material.dart';
import 'beginner_page.dart';
import 'beginner_page1.dart';
import 'advanced_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أسئلة الاستدامة',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'اختر مستواك',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              _buildSimpleCard(context, 'مبتدئ', BeginnerPage(), Icons.star),
              SizedBox(height: 15),
              _buildSimpleCard(
                  context, 'متوسط', BeginnerPage1(), Icons.star_border),
              SizedBox(height: 15),
              _buildSimpleCard(
                  context, 'محترف', AdvancedPage(), Icons.star_half),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleCard(
      BuildContext context, String title, Widget page, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => page)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
