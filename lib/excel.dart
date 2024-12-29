import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'stock.dart';

Future<void> exportToExcel(List<Stock> stockList) async {
  // Create a new Excel document
  final xlsio.Workbook workbook = xlsio.Workbook();
  final xlsio.Worksheet sheet = workbook.worksheets[0];

  // Set the headers
  sheet.getRangeByName('A1').setValue('Item Name');
  sheet.getRangeByName('B1').setValue('Quantity');
  sheet.getRangeByName('C1').setValue('Units');
  sheet.getRangeByName('D1').setValue('Rate');

  // Add data to the sheet
  for (int i = 0; i < stockList.length; i++) {
    sheet.getRangeByName('A${i + 2}').setValue(stockList[i].name);
    sheet.getRangeByName('B${i + 2}').setValue(stockList[i].quantity);
    sheet.getRangeByName('C${i + 2}').setValue(stockList[i].units);
    sheet.getRangeByName('D${i + 2}').setValue(stockList[i].rate);
  }

  // Save the document
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  // Get the directory to save the file
  final String path = (await getApplicationDocumentsDirectory()).path;
  final String fileName = '$path/StockData.xlsx';
  final File file = File(fileName);

  // Write the bytes to the file
  await file.writeAsBytes(bytes, flush: true);

  // Optionally, show a message to the user
  print('Excel file saved at $fileName');
}

class StockExportScreen extends StatelessWidget {
  final List<Stock> stockList = [
    Stock(name: 'Item 1', quantity: 10, units: 5, rate: 100.0, store: ''),
    Stock(name: 'Item 2', quantity: 20, units: 10, rate: 200.0, store: ''),
    // Add more stock items as needed
  ];

  StockExportScreen({super.key});

  Future<void> exportToExcel(List<Stock> stockList) async {
    final xlsio.Workbook workbook = xlsio.Workbook();
    final xlsio.Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A1').setValue('Item Name');
    sheet.getRangeByName('B1').setValue('Quantity');
    sheet.getRangeByName('C1').setValue('Units');
    sheet.getRangeByName('D1').setValue('Rate');

    for (int i = 0; i < stockList.length; i++) {
      sheet.getRangeByName('A${i + 2}').setValue(stockList[i].name);
      sheet.getRangeByName('B${i + 2}').setValue(stockList[i].quantity);
      sheet.getRangeByName('C${i + 2}').setValue(stockList[i].units);
      sheet.getRangeByName('D${i + 2}').setValue(stockList[i].rate);
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationDocumentsDirectory()).path;
    final String fileName = '$path/StockData.xlsx';
    final File file = File(fileName);

    await file.writeAsBytes(bytes, flush: true);
    print('Excel file saved at $fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Stock to Excel')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            exportToExcel(stockList);
          },
          child: const Text('Export to Excel'),
        ),
      ),
    );
  }
}