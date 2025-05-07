import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeginnerPage(),
    );
  }
}

class BeginnerPage extends StatefulWidget {
  @override
  _BeginnerPageState createState() => _BeginnerPageState();
}

class _BeginnerPageState extends State<BeginnerPage> {
  Map<int, String?> selectedAnswers = {};
  final Map<int, String> correctAnswers = {
    1: 'إعادة التدوير',
    2: 'تقليل استهلاك الكهرباء',
    3: 'استخدام الأكياس القماشية',
    4: 'النقل العام',
    5: 'تقليل النفايات',
    6: 'المنتجات المحلية',
    7: 'إغلاق الصنبور',
    8: 'الطاقة الشمسية',
    9: 'زراعة الأشجار',
    10: 'تقليل استخدام البلاستيك',
  };

  void _calculateScore() {
    int score = selectedAnswers.entries
        .where((entry) => entry.value == correctAnswers[entry.key])
        .length;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('نقاطك: $score/${correctAnswers.length}'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('أسئلة المبتدئين'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildQuestion(1, 'أفضل طريقة للتعامل مع النفايات؟',
                ['إعادة التدوير', 'رميها في الشارع', 'حرقها']),
            _buildQuestion(2, 'كيف توفر الطاقة في المنزل؟', [
              'تقليل استهلاك الكهرباء',
              'ترك الأضواء مفتوحة',
              'استخدام المكيف طوال اليوم'
            ]),
            _buildQuestion(3, 'البديل للأكياس البلاستيكية؟',
                ['الأكياس القماشية', 'الأكياس الورقية', 'عدم استخدام أكياس']),
            _buildQuestion(4, 'أفضل وسيلة لتقليل انبعاثات الكربون؟',
                ['النقل العام', 'السيارة الخاصة', 'الطائرة']),
            _buildQuestion(5, 'لماذا نقلل استهلاك الموارد؟',
                ['تقليل النفايات', 'زيادة التكاليف', 'إهدار الوقت']),
            _buildQuestion(6, 'يدعم الاستدامة في التسوق؟',
                ['المنتجات المحلية', 'المستوردة', 'البلاستيكية']),
            _buildQuestion(7, 'كيف توفر الماء؟',
                ['إغلاق الصنبور', 'تركه مفتوحًا', 'استخدام الماء الساخن فقط']),
            _buildQuestion(8, 'مصادر الطاقة المتجددة؟',
                ['الطاقة الشمسية', 'الفحم', 'النفط']),
            _buildQuestion(9, 'يحسن جودة الهواء؟',
                ['زراعة الأشجار', 'قطع الأشجار', 'زيادة السيارات']),
            _buildQuestion(10, 'يقلل التلوث البيئي؟',
                ['تقليل البلاستيك', 'رمي النفايات في البحر', 'المبيدات']),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateScore,
              child: Text('حساب النتيجة'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30),
                backgroundColor: Colors.blue,
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
