import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  final List<String> products;

  ProductPage([this.products = const []]) {
    print('ProductPage Constructor');
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
        leading: const Icon(Icons.event_seat), title: Text(document['name']));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Details'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('grocer_shop').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]));
          }),
    );
  }
}
