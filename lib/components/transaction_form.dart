import 'dart:io';

import 'package:expenses/components/adaptable/adaptable_button.dart';
import 'package:expenses/components/adaptable/adaptable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _selectedDateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value =
        double.tryParse(_valueController.text.replaceAll(',', '.')) ?? 0.0;
    final date = _selectedDateController.text;

    if (title.isEmpty || value <= 0.0 || date.isEmpty) return;

    widget.onSubmit(
      title,
      value,
      _selectedDate,
    );
  }

  _showDatePicker() {
    DateTime maxDate = DateTime.now();
    DateTime minDate = DateTime(2020);

    changeDate(DateTime? date) {
      setState(() {
        if (date == null) return;

        _selectedDate = date;
        _selectedDateController.text =
            DateFormat('dd/MM/y').format(_selectedDate);
      });
    }

    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
                height: 216,
                padding: const EdgeInsets.only(top: 6.0),
                // The Bottom margin is provided to align the popup above the system navigation bar.
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // Provide a background color for the popup.
                color: CupertinoColors.systemBackground.resolveFrom(context),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(
                  top: false,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _selectedDate,
                    maximumDate: maxDate,
                    minimumDate: minDate,
                    onDateTimeChanged: changeDate,
                  ),
                ),
              ));
    } else {
      showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: minDate,
        lastDate: maxDate,
      ).then(changeDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      actionsPadding: EdgeInsets.all(20),
      insetPadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AdaptableTextField(
                controller: _titleController,
                onSubmitted: _submitForm,
                textInputAction: TextInputAction.send,
                label: 'Título',
              ),
              AdaptableTextField(
                controller: _valueController,
                onSubmitted: _submitForm,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.done,
                label: 'Valor (R\$)',
              ),
              AdaptableTextField(
                controller: _selectedDateController,
                label: 'Data da Transação',
                suffixIcon: Icon(Icons.calendar_month),
                onTap: _showDatePicker,
                readOnly: true,
              )
            ],
          ),
        ),
      ),
      actions: [
        AdaptableButton(
          onPressed: _submitForm,
          textColor: Theme.of(context).primaryColor,
          child: Text(
            'Nova transação',
          ),
        ),
      ],
    );
  }
}
