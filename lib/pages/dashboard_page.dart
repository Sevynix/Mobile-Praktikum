import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_providers.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildCard(
                  'Mahasiswa',
                  provider.mahasiswa,
                  Icons.school,
                  Colors.blue,
                  provider.tambahMahasiswa,
                ),
                const SizedBox(height: 15),
                _buildCard(
                  'Dosen',
                  provider.dosen,
                  Icons.person,
                  Colors.green,
                  provider.tambahDosen,
                ),
                const SizedBox(height: 15),
                _buildCard(
                  'Mata Kuliah',
                  provider.mataKuliah,
                  Icons.book,
                  Colors.orange,
                  provider.tambahMataKuliah,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(
      String title,
      int count,
      IconData icon,
      Color color,
      VoidCallback onTap,
      ) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text('Total: $count'),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle),
          color: color,
          onPressed: onTap,
        ),
      ),
    );
  }
}