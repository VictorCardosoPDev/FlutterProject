import 'package:flutter/material.dart';

// ========================= DADOS GLOBAIS (SIMULAÇÃO DE BANCO DE DADOS) =========================
// Lista global para armazenar os gados cadastrados dinamicamente.
List<Gado> gadosCadastrados = [];

void main() {
  runApp(const GerenciamentoGadoApp());
}

// ========================= MODELO DE DADOS =========================
class Gado {
  final String nome;
  final String idade;
  final String peso;
  final String vacinas;
  final String sexo;

  Gado({
    required this.nome,
    required this.idade,
    required this.peso,
    required this.vacinas,
    required this.sexo,
  });
}

class GerenciamentoGadoApp extends StatelessWidget {
  const GerenciamentoGadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Gado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ========================= LOGIN PAGE =========================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o e-mail' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a senha' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Entrar'),
              ),
              TextButton(
                onPressed: _goToRegister,
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================= CADASTRO DE USUÁRIO =========================
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o nome' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o e-mail' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a senha' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================= DASHBOARD (PAINEL) =========================
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _goToGadoList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListaGadoPage()),
    );
  }

  void _goToGadoCadastro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastrarGadoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Painel de Gado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.dashboard, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo ao Painel!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Selecione uma opção abaixo:'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _goToGadoCadastro(context),
              icon: const Icon(Icons.add),
              label: const Text('Cadastrar Novo Gado'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _goToGadoList(context),
              icon: const Icon(Icons.list),
              label: const Text('Ver Lista de Gados'),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================= CADASTRO DE GADO =========================
class CadastrarGadoPage extends StatefulWidget {
  const CadastrarGadoPage({super.key});

  @override
  State<CadastrarGadoPage> createState() => _CadastrarGadoPageState();
}

class _CadastrarGadoPageState extends State<CadastrarGadoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _vacinasController = TextEditingController();

  String? _sexoSelecionado;

  void _salvarCadastro() {
    if (_formKey.currentState!.validate()) {
      final novoGado = Gado(
        nome: _nomeController.text,
        idade: _idadeController.text,
        peso: _pesoController.text,
        vacinas: _vacinasController.text.isEmpty ? 'N/A' : _vacinasController.text,
        sexo: _sexoSelecionado ?? 'Não informado',
      );

      gadosCadastrados.add(novoGado);

      // Limpa os campos para novo cadastro
      _nomeController.clear();
      _idadeController.clear();
      _pesoController.clear();
      _vacinasController.clear();
      setState(() {
        _sexoSelecionado = null;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cadastro realizado'),
          content: Text('${novoGado.nome} foi adicionado à lista com sucesso!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Gado')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Gado',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o nome do gado' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Idade (em meses)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Informe a idade' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (em kg)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o peso' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _vacinasController,
                decoration: const InputDecoration(
                  labelText: 'Vacinas aplicadas (Opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(),
                ),
                value: _sexoSelecionado,
                items: const [
                  DropdownMenuItem(value: 'Macho', child: Text('Macho')),
                  DropdownMenuItem(value: 'Fêmea', child: Text('Fêmea')),
                ],
                onChanged: (value) {
                  setState(() {
                    _sexoSelecionado = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Selecione o sexo' : null,
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: _salvarCadastro,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Cadastro'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================= LISTA DE GADO (DINÂMICA) =========================
class ListaGadoPage extends StatelessWidget {
  const ListaGadoPage({super.key});

  void _goToDetalhe(BuildContext context, Gado gado) {
    // 2. Navega para a tela de detalhes, passando o objeto Gado
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetalheGadoPage(gado: gado)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (gadosCadastrados.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Gado Cadastrado')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber, size: 50, color: Colors.grey),
              SizedBox(height: 10),
              Text(
                'Nenhum gado cadastrado ainda.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Gado Cadastrado (${gadosCadastrados.length})')),
      body: ListView.builder(
        itemCount: gadosCadastrados.length,
        itemBuilder: (context, index) {
          final gado = gadosCadastrados[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Icon(
                gado.sexo == 'Macho' ? Icons.male : Icons.female,
                color: gado.sexo == 'Macho' ? Colors.blue : Colors.pink,
                size: 40,
              ),
              title: Text(gado.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Idade: ${gado.idade} meses | Peso: ${gado.peso} kg'),
              trailing: Text(gado.sexo),
              // 1. CHAMA A NAVEGAÇÃO AO CLICAR
              onTap: () => _goToDetalhe(context, gado),
            ),
          );
        },
      ),
    );
  }
}

// ========================= NOVA TELA: DETALHES DO GADO =========================
class DetalheGadoPage extends StatelessWidget {
  // A tela precisa receber um objeto Gado para exibir as informações
  final Gado gado;

  const DetalheGadoPage({super.key, required this.gado});

  // Função auxiliar para construir as linhas de informação
  Widget _buildInfoRow(String label, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gado.nome),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Icon(
                    gado.sexo == 'Macho' ? Icons.pets : Icons.favorite_border,
                    color: gado.sexo == 'Macho' ? Colors.blue : Colors.pink,
                    size: 80,
                  ),
                ),
                const Divider(height: 30, thickness: 1),
                
                // Exibindo as informações
                _buildInfoRow(
                  'Nome',
                  gado.nome,
                  Icons.label_important,
                  Colors.green,
                ),
                _buildInfoRow(
                  'Idade',
                  '${gado.idade} meses',
                  Icons.cake,
                  Colors.orange,
                ),
                _buildInfoRow(
                  'Peso',
                  '${gado.peso} kg',
                  Icons.line_weight,
                  Colors.brown,
                ),
                _buildInfoRow(
                  'Sexo',
                  gado.sexo,
                  gado.sexo == 'Macho' ? Icons.male : Icons.female,
                  gado.sexo == 'Macho' ? Colors.blue : Colors.pink,
                ),
                _buildInfoRow(
                  'Vacinas',
                  gado.vacinas,
                  Icons.local_hospital,
                  Colors.red,
                ),
                
                const SizedBox(height: 20),
                const Text(
                  'Este é o registro detalhado do animal. Funcionalidades como edição ou exclusão podem ser adicionadas aqui.',
                  style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}