import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ishimwe Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C49A), // Mint green
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Off-white
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002B5B), // Navy blue
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C49A),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: PortfolioHome(onToggleTheme: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHome extends StatefulWidget {
  final void Function(bool) onToggleTheme;
  const PortfolioHome({super.key, required this.onToggleTheme});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeSection(),
    AboutSection(),
    ProjectsSection(),
    CertificatesSection(),
    const ContactSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ishimwe Jean Claude'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: widget.onToggleTheme,
              ),
              const Icon(Icons.dark_mode),
            ],
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'About'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.school), label: 'Certificates'),
          NavigationDestination(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/licky.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'ISHIMWE JEAN CLAUDE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002B5B),
            ),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  final String bio =
      'Software Developer specializing in Python, Flutter, and Generative AI. Skilled in secure, scalable apps, data analysis, and scientific computing. Certified in CCNA and Ethical Hacking.';

  final List<String> skills = [
    'Dart', 'Flutter', 'Firebase', 'REST APIs', 'Python', 'Cybersecurity'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('About Me', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF002B5B))),
        const SizedBox(height: 8),
        Text(bio),
        const SizedBox(height: 16),
        Text('Skills', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFF002B5B))),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: skills.map((skill) => Chip(
            label: Text(skill, style: const TextStyle(color: Color(0xFF002B5B))),
            backgroundColor: const Color(0xFFB2F2E6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )).toList(),
        ),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'AgriTech AI',
      'description': 'Smart farming app with AI features',
      'tech': 'Flutter, Firebase, Python',
      'link': 'https://github.com/ishimwe/agritech-ai'
    },
    {
      'title': 'TravelMate',
      'description': 'Travel planner with weather and maps',
      'tech': 'Flutter, REST APIs',
      'link': 'https://github.com/ishlicky/travelmate'
    },
    {
      'title': 'SRAILA',
      'description': 'Multilingual, adaptive, and gamified learning across Rwanda.',
      'tech': 'Flutter, REST APIs',
      'link': 'https://github.com/ishlicky/SRAILA'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(project['title']!, style: const TextStyle(color: Color(0xFF002B5B))),
            subtitle: Text('${project['description']}\nTech: ${project['tech']}'),
            trailing: IconButton(
              icon: const Icon(Icons.link, color: Color(0xFF00C49A)),
              onPressed: () {
                // TODO: Add url_launcher logic
              },
            ),
          ),
        );
      },
    );
  }
}

class CertificatesSection extends StatelessWidget {
  CertificatesSection({super.key});

  final List<String> certificates = [
    'CCNA, Cisco',
    'Ethical Hacking, Cisco',
    'Generative AI (Master, Medium, Foundations)',
    'Scientific Computing with Python',
    'Flutter & Front-End Libraries',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: certificates
          .map((cert) => ListTile(
        leading: const Icon(Icons.verified, color: Color(0xFF00C49A)),
        title: Text(cert, style: const TextStyle(color: Color(0xFF002B5B))),
      ))
          .toList(),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(
          leading: Icon(Icons.email, color: Color(0xFF00C49A)),
          title: Text('ishimwejeanclaude088@gmail.com'),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Color(0xFF00C49A)),
          title: Text('+250 787377750'),
        ),
        ListTile(
          leading: Icon(Icons.link, color: Color(0xFF00C49A)),
          title: Text('linkedin.com/in/ishimwe jean claude'),
        ),
        ListTile(
          leading: Icon(Icons.code, color: Color(0xFF00C49A)),
          title: Text('github.com/ishlicky'),
        ),
      ],
    );
  }
}
