import 'package:flutter/material.dart';

// ========================= DADOS GLOBAIS =========================
List<Gado> gadosCadastrados = [];

const List<String> listaOpcoesVacinas = [
  'Febre Aftosa',
  'Brucelose',
  'Raiva',
  'Leptospirose',
  'Clostridiose',
  'Botulismo',
  'IBR/BVD',
];

void main() {
  runApp(const GerenciamentoGadoApp());
}

// ========================= MODELO DE DADOS =========================
class Gado {
  String nome;
  String idade;
  String peso;
  String vacinas;
  String sexo;

  Gado({
    required this.nome,
    required this.idade,
    required this.peso,
    required this.vacinas,
    required this.sexo,
  });
}

// ========================= NOVO WIDGET: PADRÃO DE FUNDO (GRÃO) =========================
class CattleBackgroundPattern extends StatelessWidget {
  const CattleBackgroundPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.03, // Opacidade super baixa (3%)
      child: Container(
        color: Colors.transparent, 
        child: GridView.count(
          crossAxisCount: 3, 
          children: List.generate(9, (index) { 
            return const Icon(
              Icons.grain_rounded, // Ícone de Grão/Ração (Farm Theme)
              size: 150, 
              color: Color(0xFFBCAAA4), // Marrom suave
            );
          }),
        ),
      ),
    );
  }
}

class GerenciamentoGadoApp extends StatelessWidget {
  const GerenciamentoGadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // === TEMA ESTILO "RURAL CLEAN" ===
    return MaterialApp(
      title: 'Projeto Gado',
      theme: ThemeData(
        useMaterial3: true,
        // Fundo Alterado: Bege claro (menos branco, mais quente)
        scaffoldBackgroundColor: const Color(0xFFEFEBE9), 
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF10B981), 
          primary: const Color(0xFF10B981),
          secondary: const Color(0xFF1F2937), 
          surface: Colors.white,
          background: const Color(0xFFEFEBE9),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, 
          foregroundColor: Color(0xFF1F2937), 
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20, 
            fontWeight: FontWeight.w800, 
            letterSpacing: -0.5,
          ),
          iconTheme: IconThemeData(color: Color(0xFF1F2937)),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF10B981), 
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none, 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF10B981), width: 2),
          ),
          prefixIconColor: Colors.grey,
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ========================= LOGIN PAGE (COM TOURO/GADO) =========================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack( 
        children: [
          const CattleBackgroundPattern(), // PADRÃO DE FUNDO
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Ícone de Gado (Touro)
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                        Icons.pets_rounded, // ÍCONE GADO
                        size: 40, 
                        color: Color(0xFF10B981)
                      ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Projeto Gado',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.w900, 
                      color: Color(0xFF1F2937),
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bem-vindo de volta',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 40),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: Icon(Icons.alternate_email_rounded),
                          ),
                          validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                          ),
                          validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Entrar no Sistema'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Não tem conta? Cadastre-se', style: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ========================= CADASTRO USUÁRIO =========================
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome', prefixIcon: Icon(Icons.person_outline)),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.email_outlined)),
            ),
             const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha', prefixIcon: Icon(Icons.lock_outline)),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sucesso!')));
                  Navigator.pop(context);
                },
                child: const Text('Cadastrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ========================= DASHBOARD (COM TOURO/GADO) =========================
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget _buildMenuCard(BuildContext context, {
    required String title, 
    required IconData icon, 
    required Color color,
    required VoidCallback onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Acessar',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto Gado'),
        centerTitle: false, 
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded))
        ],
      ),
      body: Stack( 
        children: [
          const CattleBackgroundPattern(), // PADRÃO DE FUNDO
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Visão Geral',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.85, 
                    children: [
                      // ÍCONE GADO/TOURO AQUI
                      _buildMenuCard(
                        context,
                        title: 'Cadastrar\nAnimal',
                        icon: Icons.pets_rounded, // ÍCONE GADO
                        color: const Color(0xFF10B981),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastrarGadoPage())),
                      ),
                      _buildMenuCard(
                        context,
                        title: 'Meu\nRebanho',
                        icon: Icons.format_list_bulleted_rounded,
                        color: const Color(0xFF3B82F6), 
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListaGadoPage())),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _pesoController = TextEditingController();
  String? _sexoSelecionado;
  List<String> _vacinasSelecionadas = [];

  Future<void> _selecionarVacinas() async {
    final List<String>? result = await showDialog(
      context: context,
      builder: (ctx) => MultiSelectVacinasDialog(todas: listaOpcoesVacinas, atuais: _vacinasSelecionadas),
    );
    if (result != null) setState(() => _vacinasSelecionadas = result);
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      gadosCadastrados.add(Gado(
        nome: _nomeController.text,
        idade: _idadeController.text,
        peso: _pesoController.text,
        vacinas: _vacinasSelecionadas.isEmpty ? 'N/A' : _vacinasSelecionadas.join(', '),
        sexo: _sexoSelecionado ?? 'Não informado',
      ));
      
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 60),
                const SizedBox(height: 16),
                const Text('Sucesso!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('Animal registrado.'),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                   Navigator.pop(context); 
                   Navigator.pop(context); 
                }, child: const Text('OK'))
              ],
            ),
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Cadastro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Container Branco para o formulário
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0,4))]
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomeController,
                      decoration: const InputDecoration(labelText: 'Identificação/Nome', prefixIcon: Icon(Icons.tag_rounded)),
                      validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: TextFormField(
                          controller: _idadeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Idade (meses)', prefixIcon: Icon(Icons.calendar_month_rounded)),
                          validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
                        )),
                        const SizedBox(width: 16),
                        Expanded(child: TextFormField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Peso (kg)', prefixIcon: Icon(Icons.scale_rounded)),
                          validator: (v) => v!.isEmpty ? 'Obrigatório' : null,
                        )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      readOnly: true,
                      onTap: _selecionarVacinas,
                      decoration: InputDecoration(
                        labelText: 'Vacinas',
                        prefixIcon: const Icon(Icons.medical_services_outlined),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: _vacinasSelecionadas.isEmpty ? 'Selecione...' : '${_vacinasSelecionadas.length} item(s)',
                      ),
                    ),
                     const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _sexoSelecionado,
                      decoration: const InputDecoration(labelText: 'Sexo', prefixIcon: Icon(Icons.pets)),
                      items: const [
                        DropdownMenuItem(value: 'Macho', child: Text('Macho')),
                        DropdownMenuItem(value: 'Fêmea', child: Text('Fêmea')),
                      ],
                      onChanged: (v) => setState(() => _sexoSelecionado = v),
                      validator: (v) => v == null ? 'Obrigatório' : null,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _salvar, child: const Text('SALVAR ANIMAL')))
            ],
          ),
        ),
      ),
    );
  }
}

// ========================= LISTA DE GADO =========================
class ListaGadoPage extends StatefulWidget {
  const ListaGadoPage({super.key});

  @override
  State<ListaGadoPage> createState() => _ListaGadoPageState();
}

class _ListaGadoPageState extends State<ListaGadoPage> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rebanho (${gadosCadastrados.length})')),
      body: gadosCadastrados.isEmpty
        ? Center(child: Text('Nenhum dado encontrado', style: TextStyle(color: Colors.grey.shade400)))
        : ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: gadosCadastrados.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = gadosCadastrados[index];
              final isMacho = item.sexo == 'Macho';
              return GestureDetector(
                onTap: () async {
                   await Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheGadoPage(gado: item, onUpdate: _refresh)));
                   _refresh();
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))]
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50, height: 50,
                        decoration: BoxDecoration(
                          color: isMacho ? Colors.blue.withOpacity(0.1) : Colors.pink.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(isMacho ? Icons.male : Icons.female, color: isMacho ? Colors.blue : Colors.pink),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1F2937))),
                            const SizedBox(height: 4),
                            Text('${item.peso}kg • ${item.idade} meses', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey)
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}

// ========================= DIALOG MULTI SELECT (Auxiliar) =========================
class MultiSelectVacinasDialog extends StatefulWidget {
  final List<String> todas;
  final List<String> atuais;
  const MultiSelectVacinasDialog({super.key, required this.todas, required this.atuais});

  @override
  State<MultiSelectVacinasDialog> createState() => _MultiSelectState();
}
class _MultiSelectState extends State<MultiSelectVacinasDialog> {
  late List<String> _temp;
  @override
  void initState() {
    super.initState();
    _temp = List.from(widget.atuais);
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Selecionar Vacinas'),
      content: SingleChildScrollView(
        child: Column(
          children: widget.todas.map((v) => CheckboxListTile(
            title: Text(v),
            value: _temp.contains(v),
            activeColor: const Color(0xFF10B981),
            onChanged: (chk) => setState(() => chk! ? _temp.add(v) : _temp.remove(v)),
          )).toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar', style: TextStyle(color: Colors.grey))),
        ElevatedButton(onPressed: () => Navigator.pop(context, _temp), child: const Text('Confirmar')),
      ],
    );
  }
}

// ========================= DETALHES E EDIÇÃO =========================
class DetalheGadoPage extends StatefulWidget {
  final Gado gado;
  final VoidCallback onUpdate;
  const DetalheGadoPage({super.key, required this.gado, required this.onUpdate});

  @override
  State<DetalheGadoPage> createState() => _DetalheState();
}

class _DetalheState extends State<DetalheGadoPage> {
  late TextEditingController _nomeCtrl;
  late TextEditingController _idadeCtrl;
  late TextEditingController _pesoCtrl;
  bool _editando = false;

  @override
  void initState() {
    super.initState();
    _nomeCtrl = TextEditingController(text: widget.gado.nome);
    _idadeCtrl = TextEditingController(text: widget.gado.idade);
    _pesoCtrl = TextEditingController(text: widget.gado.peso);
  }

  void _salvar() {
    widget.gado.nome = _nomeCtrl.text;
    widget.gado.idade = _idadeCtrl.text;
    widget.gado.peso = _pesoCtrl.text;
    widget.onUpdate();
    setState(() => _editando = false);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Atualizado!')));
  }

  void _excluir() {
    gadosCadastrados.remove(widget.gado);
    widget.onUpdate();
    Navigator.pop(context);
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editando ? 'Editando' : 'Detalhes'),
        actions: [
          IconButton(
            icon: Icon(_editando ? Icons.save : Icons.edit),
            onPressed: () {
              if (_editando) _salvar();
              else setState(() => _editando = true);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.pets, size: 50, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 30),

            _campo('Nome', _nomeCtrl, Icons.tag),
            const SizedBox(height: 16),
            _campo('Idade (meses)', _idadeCtrl, Icons.calendar_today),
            const SizedBox(height: 16),
            _campo('Peso (kg)', _pesoCtrl, Icons.scale),
            
            const SizedBox(height: 40),
            if (_editando)
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: _excluir, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100, foregroundColor: Colors.red),
                  child: const Text('Excluir Animal'),
                )
              )
          ],
        ),
      ),
    );
  }

  Widget _campo(String label, TextEditingController ctrl, IconData icon) {
    return TextFormField(
      controller: ctrl,
      enabled: _editando,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        fillColor: _editando ? Colors.white : Colors.transparent,
      ),
    );
  }
}