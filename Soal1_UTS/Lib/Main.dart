import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==========================================
// APLIKASI UTAMA
// ==========================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Aditiya Surya Putra',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}

// ==========================================
// HALAMAN PROFIL
// ==========================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Informasi Aplikasi',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Profil Mahasiswa',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    '© 2026 Aditiya Surya Putra',
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 750,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // HEADER PROFIL
                  const ProfileHeader(),

                  const SizedBox(height: 25),

                  // INFORMASI KONTAK
                  const InfoCard(
                    title: 'Informasi Kontak',
                    icon: Icons.contact_mail,
                    items: [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'aditiyasuryaputra75@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '081313619268',
                      ),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Kelas',
                        value: 'TI 24 SE M',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'Adtproject25',
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // KEAHLIAN DAN HOBI
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            icon: Icons.stars,
                            title: 'Keahlian dan Hobi',
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Hobi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const SkillChip(
                            icon: Icons.camera_alt,
                            label: 'Fotografi',
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Keahlian',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              SkillChip(
                                icon: Icons.video_library,
                                label: 'Video Editing',
                              ),
                              SkillChip(
                                icon: Icons.design_services,
                                label: 'Desain Grafis',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // FOOTER
                  const Center(
                    child: Text(
                      '© 2026 Aditiya Surya Putra',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Terima kasih telah mengunjungi profil saya!',
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.favorite),
        label: const Text('Terima Kasih'),
      ),
    );
  }
}

// ==========================================
// HEADER PROFIL MAHASISWA
// ==========================================

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 58,
              backgroundColor: Colors.blue,
              child: Text(
                'AS',
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              'Aditiya Surya Putra',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme.headlineSmall
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 8),

            Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 18),

            const Divider(),

            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.badge_outlined,
                  size: 19,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'NIM: 1124160148',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 19,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Kelas: TI 24 SE M',
                    textAlign: TextAlign.center,
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

// ==========================================
// KARTU INFORMASI
// ==========================================

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<InfoTile> items;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SectionTitle(
              icon: icon,
              title: title,
            ),

            const SizedBox(height: 12),

            ...items.map(
              (item) => item,
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// JUDUL BAGIAN
// ==========================================

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 25,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme.titleLarge
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// INFORMASI DETAIL
// ==========================================

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),

      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),

      subtitle: SelectableText(value),
    );
  }
}

// ==========================================
// CHIP KEAHLIAN DAN HOBI
// ==========================================

class SkillChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const SkillChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        icon,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(label),
      backgroundColor:
          Theme.of(context).colorScheme.primaryContainer,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
    );
  }
}
