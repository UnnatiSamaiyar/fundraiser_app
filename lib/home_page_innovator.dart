import 'package:flutter/material.dart';

class InnovatorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Innovator Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 20),
              ProjectSummaryCard(
                title: 'Save the Rainforest',
                description: 'Help us protect the rainforest.',
                amountRaised: 5000,
                goalAmount: 10000,
                milestones: ['Milestone 1', 'Milestone 2'],
              ),
              SizedBox(height: 20),
              Text(
                'Funding Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 10),
              FundingDetails(
                totalFundsRaised: 5000,
                numberOfInvestors: 150,
                recentTransactions: [
                  TransactionDetail('John Doe', 100, '2023-10-01'),
                  TransactionDetail('Jane Smith', 200, '2023-10-02'),
                ],
              ),
              // Add more sections here
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectSummaryCard extends StatelessWidget {
  final String title;
  final String description;
  final double amountRaised;
  final double goalAmount;
  final List<String> milestones;

  ProjectSummaryCard({
    required this.title,
    required this.description,
    required this.amountRaised,
    required this.goalAmount,
    required this.milestones,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: amountRaised / goalAmount,
              backgroundColor: Colors.grey[300],
              color: Colors.teal,
            ),
            SizedBox(height: 5),
            Text('\$${amountRaised.toStringAsFixed(2)} raised of \$${goalAmount.toStringAsFixed(2)} goal'),
            SizedBox(height: 10),
            Text('Milestones:'),
            for (var milestone in milestones) Text('- $milestone'),
          ],
        ),
      ),
    );
  }
}

class FundingDetails extends StatelessWidget {
  final double totalFundsRaised;
  final int numberOfInvestors;
  final List<TransactionDetail> recentTransactions;

  FundingDetails({
    required this.totalFundsRaised,
    required this.numberOfInvestors,
    required this.recentTransactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Funds Raised: \$${totalFundsRaised.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.teal),
            ),
            Text(
              'Number of Investors: $numberOfInvestors',
              style: TextStyle(color: Colors.teal),
            ),
            SizedBox(height: 10),
            Text('Recent Transactions:'),
            for (var transaction in recentTransactions)
              Text('${transaction.investorName} - \$${transaction.amount} on ${transaction.date}'),
          ],
        ),
      ),
    );
  }
}

class TransactionDetail {
  final String investorName;
  final double amount;
  final String date;

  TransactionDetail(this.investorName, this.amount, this.date);
}