import 'package:flutter/material.dart';

class AdvancedPage extends StatefulWidget {
  @override
  _AdvancedPageState createState() => _AdvancedPageState();
}

class _AdvancedPageState extends State<AdvancedPage> {
  Map<int, String?> selectedAnswers = {};
  final Map<int, String> correctAnswers = {
    1: 'الاقتصاد الدائري',
    2: 'انبعاثات صفرية',
    3: 'التغير المناخي',
    4: 'الطاقة الحيوية',
    5: 'البصمة الكربونية',
    6: 'إزالة الكربون',
    7: 'التكنولوجيا الخضراء',
    8: 'التنمية المستدامة',
    9: 'إعادة تدوير المياه',
    10: 'الزراعة العمودية',
  };

  void _calculateScore() {
    int score = selectedAnswers.entries
        .where((entry) => entry.value == correctAnswers[entry.key])
        .length;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('نقاطك: $score/${correctAnswers.length}'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('أسئلة المحترفين'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildQuestion(
                1, 'النموذج الاقتصادي الذي يعتمد على إعادة الاستخدام؟', [
              'الاقتصاد الدائري',
              'الاقتصاد التقليدي',
              'الاقتصاد الرأسمالي'
            ]),
            _buildQuestion(2, 'الهدف لتقليل التلوث بحلول 2050؟',
                ['انبعاثات صفرية', 'زيادة الإنتاج', 'تقليل الأرباح']),
            _buildQuestion(3, 'السبب الرئيسي لارتفاع درجات الحرارة؟',
                ['التغير المناخي', 'زيادة السكان', 'التقدم التكنولوجي']),
            _buildQuestion(4, 'مصدر الطاقة من المخلفات الزراعية؟',
                ['الطاقة الحيوية', 'الطاقة النووية', 'الطاقة الحرارية']),
            _buildQuestion(5, 'مقياس تأثير الأفراد على البيئة؟',
                ['البصمة الكربونية', 'الاستهلاك المائي', 'إنتاج النفايات']),
            _buildQuestion(6, 'التقنية لاستخلاص ثاني أكسيد الكربون؟',
                ['إزالة الكربون', 'التلوث الصناعي', 'التبريد الكيميائي']),
            _buildQuestion(7, 'الابتكارات التي تحافظ على البيئة؟', [
              'التكنولوجيا الخضراء',
              'التكنولوجيا القديمة',
              'التكنولوجيا النووية'
            ]),
            _buildQuestion(8, 'المفهوم الذي يوازن النمو الاقتصادي والبيئة؟',
                ['التنمية المستدامة', 'النمو السريع', 'الاستهلاك المفرط']),
            _buildQuestion(9, 'إعادة استخدام مياه الصرف الصحي؟',
                ['إعادة تدوير المياه', 'التخلص من المياه', 'تلويث الأنهار']),
            _buildQuestion(10, 'التقنية الزراعية للمدن؟',
                ['الزراعة العمودية', 'الزراعة التقليدية', 'الزراعة الصحراوية']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateScore,
              child: Text('حساب النتيجة'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30),
                backgroundColor: Colors.purple,
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
                  onChanged: (value) =>
                      setState(() => selectedAnswers[index] = value),
                )),
          ],
        ),
      ),
    );
  }
}
