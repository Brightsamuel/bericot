import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'excel.dart';
import 'stock.dart';

class StockScreen extends StatefulWidget { 
    final String assetType; 
    const StockScreen({required this.assetType, super.key}); 

@override 
_StockScreenState createState() => _StockScreenState(); 
} 

class _StockScreenState extends State<StockScreen> {
   String? selectedStore;
  List<Stock> stockList = [];

  List<DropdownMenuItem<String>> get items {
    return const [
      DropdownMenuItem(value: "Stock in", child: Text("Stock in")),
      DropdownMenuItem(value: "Stock out", child: Text("Stock out")),
    ];
  }

  void _showAddStockDialog(BuildContext context) {
    final nameController = TextEditingController();
    final unitsController = TextEditingController();
    final quantityController = TextEditingController();     
    final rateController = TextEditingController(); 
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Stock'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField( 
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: unitsController,
                decoration: const InputDecoration(labelText: 'Units'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: rateController,
                decoration: const InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final quantity = int.tryParse(quantityController.text) ?? 0;
                final units = int.tryParse(unitsController.text) ?? 0;
                final rate = double.tryParse(rateController.text) ?? 0.0;

                if (name.isNotEmpty && quantity > 0 && rate > 0) {
                  if (selectedStore != null) {
                    _addStock(name, quantity, units, rate, selectedStore!);
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a store')),
                    );
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addStock(String name, int quantity, int units, double rate, String store) {
    if (name.isNotEmpty && quantity > 0 && rate > 0) {
      final stock = Stock(
        name: name,
        quantity: quantity,
        units: units,
        rate: rate,
        store: store,
      );
      setState(() {
        stockList.add(stock);
      });
    }
  }

  void _showEditStockDialog(BuildContext context, Stock stock, int index) {
    final nameController = TextEditingController(text: stock.name);
    final unitsController = TextEditingController(text: stock.units.toString());
    final quantityController = TextEditingController(text: stock.quantity.toString());     
    final rateController = TextEditingController(text: stock.rate.toString()); 

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Stock'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: unitsController,
                decoration: const InputDecoration(labelText: 'Units'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: rateController,
                decoration: const InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final quantity = int.tryParse(quantityController.text) ?? 0;
                final units = int.tryParse(unitsController.text) ?? 0;
                final rate = double.tryParse(rateController.text) ?? 0.0;

                if (name.isNotEmpty && quantity > 0 && rate > 0) {
                  setState(() {
                    stockList[index] = Stock(
                      name: name,
                      quantity: quantity,
                      units: units,
                      rate: rate,
                      store: stock.store, // Keep the same store
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Stock'),
          content: const Text('Are you sure you want to delete this stock item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  stockList.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 52, 50, 205),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Stocks",
            style: GoogleFonts.poppins(
              fontSize: 35.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Store:", style: GoogleFonts.poppins()),
                const SizedBox(width: 8),
                
                const SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Store name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: selectedStore,
                  items: items,
                  onChanged: (value) {
                    setState(() {
                      selectedStore = value;
                    });
                  },
                  hint: const Text("Select Store"),
                ),
              ],
            ),
                        const SizedBox(height: 16),
            Row(
              children: [
                Text("Ref:", style: GoogleFonts.poppins()),
                const SizedBox(width: 8),
                const SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter ref',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: stockList.isEmpty
                  ? const Center(child: Text("No stock available."))
                  : ListView.builder(
                      itemCount: stockList.length,
                      itemBuilder: (context, index) {
                        final stock = stockList[index];
                        if (selectedStore == null || stock.store == selectedStore) {
                          return Card(
                            child: ListTile(
                              title: Text(stock.name),
                              subtitle: Text('Units: ${stock.units} | Unit Price: ${stock.rate} UGX'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _showEditStockDialog(context, stock, index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _showDeleteConfirmationDialog(context, index),
                                  ),
                                  Text('Total: ${stock.totalPrice.toStringAsFixed(2)} UGX'),
                                ],
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  exportToExcel(stockList); // stockList is your list of Stock objects
                },
                child: const Text('Export to Excel'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStockDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}


