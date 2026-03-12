import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_project/core/constants/app_constants.dart';
import 'package:learning_project/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:learning_project/features/dosen/presentation/widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.invalidate(dosenNotifierProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: dosenState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gagal memuat data dosen: ${error.toString()}'),
              ElevatedButton(
                onPressed: () {
                  ref.read(dosenNotifierProvider.notifier).refresh();
                },
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        data: (dosenList) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dosenNotifierProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dosenList.length,
              itemBuilder: (context, index) {
                final dosen = dosenList[index];
                return ModernDosenCard(
                  dosen: dosen,
                  gradientColors: AppConstants.dashboardGradients[index % AppConstants.dashboardGradients.length],
                  onTap: () {
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}