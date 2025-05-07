import 'package:flutter/material.dart';

class BeginnerPage1 extends StatefulWidget {
  @override
  _BeginnerPage1State createState() => _BeginnerPage1State();
}

class _BeginnerPage1State extends State<BeginnerPage1> {
  Map<int, String?> selectedAnswers = {};
  final Map<int, String> correctAnswers = {
    1: 'الطاقة المتجددة',
    2: 'تقليل استهلاك الماء',
    3: 'المنتجات العضوية',
    4: 'إعادة استخدام المواد',
    5: 'امتصاص ثاني أكسيد الكربون',
    6: 'التسميد العضوي',
    7: 'النقل المشترك',
    8: 'الأجهزة الموفرة للطاقة',
    9: 'تقليل البصمة الكربونية',
    10: 'إعادة التدوير',
  };

  void _calculateScore() {
    int score = selectedAnswers.entries
        .where((entry) => entry.value == correctAnswers[entry.key])
        .length;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('نقاطك: $score/${correctAnswers.length}'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('أسئلة مستوى متوسط'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildQuestion(1, 'ما الذي يقلل الاعتماد على الوقود الأحفوري؟',
                ['الطاقة المتجددة', 'زيادة الفحم', 'السيارات العادية']),
            _buildQuestion(2, 'أفضل طريقة للحفاظ على المياه؟',
                ['زيادة الري', 'تقليل الاستهلاك', 'ترك الصنابير مفتوحة']),
            _buildQuestion(3, 'المنتجات الداعمة للزراعة المستدامة؟',
                ['العضوية', 'المصنعة', 'البلاستيكية']),
            _buildQuestion(4, 'كيف تقلل النفايات المنزلية؟',
                ['إعادة الاستخدام', 'رمي كل شيء', 'شراء مستمر']),
            _buildQuestion(5, 'دور الأشجار في البيئة؟',
                ['امتصاص CO2', 'زيادة التلوث', 'استهلاك الماء']),
            _buildQuestion(6, 'تحويل بقايا الطعام لسماد؟',
                ['التسميد العضوي', 'القمامة', 'الحرق']),
            _buildQuestion(7, 'أفضل وسيلة نقل قصيرة؟',
                ['النقل المشترك', 'السيارة الفردية', 'الطائرة']),
            _buildQuestion(8, 'تقليل استهلاك الكهرباء؟',
                ['أجهزة موفرة', 'أجهزة قديمة', 'ترك الأضواء']),
            _buildQuestion(9, 'لماذا نختار عبوات قابلة لإعادة التدوير؟',
                ['تقليل البصمة الكربونية', 'زيادة النفايات', 'تكلفة أقل']),
            _buildQuestion(10, 'أول خطوة لإدارة النفايات؟',
                ['إعادة التدوير', 'المزيد من البلاستيك', 'التخلص من كل شيء']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateScore,
              child: Text('عرض النتيجة'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(int index, String text, List<String> options) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...options.map((option) => RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedAnswers[index],
                  onChanged: (value) {
                    setState(() => selectedAnswers[index] = value);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
