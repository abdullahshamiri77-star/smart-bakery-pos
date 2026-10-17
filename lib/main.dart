
import 'package:flutter/material.dart';

void main() {
  runApp(SmartBakeryApp());
}

class SmartBakeryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نظام المخبز الذكي',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: BakeryHome(),
    );
  }
}

class BakeryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظام المخبز والمعجنات الذكي - ERP'),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildDashboardCard(context, 'المبيعات ونقاط البيع', Icons.point_of_sale, Colors.orange),
            _buildDashboardCard(context, 'تكلفة الإنتاج', Icons.bakery_dining, Colors.brown),
            _buildDashboardCard(context, 'المخازن والمواد الخام', Icons.inventory, Colors.blue),
            _buildDashboardCard(context, 'المشتريات والموردين', Icons.shopping_cart, Colors.green),
            _buildDashboardCard(context, 'الصناديق والبنوك', Icons.account_balance_wallet, Colors.teal),
            _buildDashboardCard(context, 'المرتبات والأجور', Icons.people, Colors.purple),
            _buildDashboardCard(context, 'التقارير المالية', Icons.bar_chart, Colors.red),
            _buildDashboardCard(context, 'الإعدادات والتهيئة', Icons.settings, Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم اختيار: $title')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 35, color: color),
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown[900]),
            ),
          ],
        ),
      ),
    );
  }
}
