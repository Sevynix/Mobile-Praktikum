import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Riverpod'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang,',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    dashboard.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Statistik',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _buildStatCard(
            context,
            ref,
            'Total Mahasiswa',
            dashboard.totalMahasiswa.toString(),
            Icons.school,
            Colors.blue,
                () => ref.read(dashboardProvider.notifier).incrementMahasiswa(),
                () => ref.read(dashboardProvider.notifier).decrementMahasiswa(),
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            context,
            ref,
            'Mahasiswa Aktif',
            dashboard.mahasiswaAktif.toString(),
            Icons.person,
            Colors.green,
                () => ref.read(dashboardProvider.notifier).incrementMahasiswaAktif(),
                () => ref.read(dashboardProvider.notifier).decrementMahasiswaAktif(),
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            context,
            ref,
            'Jumlah Kelas',
            dashboard.jumlahKelas.toString(),
            Icons.class_,
            Colors.orange,
                () => ref.read(dashboardProvider.notifier).incrementKelas(),
                () => ref.read(dashboardProvider.notifier).decrementKelas(),
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            context,
            ref,
            'Tingkat Kelulusan',
            '${dashboard.tingkatKelulusan}%',
            Icons.trending_up,
            Colors.purple,
                () => ref.read(dashboardProvider.notifier).incrementKelulusan(),
                () => ref.read(dashboardProvider.notifier).decrementKelulusan(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      BuildContext context,
      WidgetRef ref,
      String title,
      String value,
      IconData icon,
      Color color,
      VoidCallback onIncrement,
      VoidCallback onDecrement,
      ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add),
                  label: const Text('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}