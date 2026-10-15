import 'package:flutter/material.dart';

class Calco extends StatefulWidget {
  const Calco({super.key});

  @override
  State<Calco> createState() => _CalcoState();
}

class _CalcoState extends State<Calco> {
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();

  double result = 0;
  String _selectedOperation = "+";
  void calculate() {
    double number1 = double.parse(_firstNumberController.text);
    double number2 = double.parse(_secondNumberController.text);
    setState(() {
      if (_selectedOperation == "+") {
        result = number1 + number2;
      } else if (_selectedOperation == "-") {
        result = number1 - number2;
      } else if (_selectedOperation == "*") {
        result = number1 * number2;
      } else if (_selectedOperation == "÷") {
        result = number1 / number2;
      }
    });
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 36, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Simple Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF111827),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Flutter TextField + function practice',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 380),
                  padding: const EdgeInsets.fromLTRB(22, 26, 22, 23),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D111827),
                        blurRadius: 30,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _FieldLabel('First number'),
                      const SizedBox(height: 10),
                      _NumberField(controller: _firstNumberController),
                      const SizedBox(height: 18),
                      const _FieldLabel('Second number'),
                      const SizedBox(height: 10),
                      _NumberField(controller: _secondNumberController),
                      const SizedBox(height: 18),
                      const _FieldLabel('Operation'),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 54,
                        child: Row(
                          children: [
                            _operationButton(
                              operation: '+',
                              child: const Icon(Icons.add, size: 24),
                            ),
                            const SizedBox(width: 10),
                            _operationButton(
                              operation: '-',
                              child: const Icon(Icons.remove, size: 24),
                            ),
                            const SizedBox(width: 10),
                            _operationButton(
                              operation: '*',
                              child: const Icon(Icons.close, size: 22),
                            ),
                            const SizedBox(width: 10),
                            _operationButton(
                              operation: '÷',
                              child: const Text(
                                '÷',
                                style: TextStyle(
                                  fontSize: 25,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),
                      SizedBox(
                        width: double.infinity,
                        height: 62,
                        child: ElevatedButton(
                          onPressed: calculate,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: .infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "RESULT",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: .w900,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "$result",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: .bold,
                          color: Color(0xFF312E81),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _operationButton({required String operation, required Widget child}) {
    final isSelected = _selectedOperation == operation;

    return Expanded(
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedOperation = operation;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
            backgroundColor: isSelected
                ? const Color(0xFF2563EB)
                : const Color(0xFFEFF6FF),
            foregroundColor: isSelected
                ? Colors.white
                : const Color(0xFF2563EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        height: 1.2,
        color: Color(0xFF374151),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(fontSize: 16, color: Color(0xFF374151)),
        decoration: InputDecoration(
          hintText: 'Enter a number',
          hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF9CA3AF)),
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFE1E5EB), width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
          ),
        ),
      ),
    );
  }
}
