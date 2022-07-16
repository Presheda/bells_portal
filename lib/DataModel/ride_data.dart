class RideData {
  String documentId;
  String recipient;
  String riderName;
  double amount;
  String riderId;
  int seat;
  String pin;
  String riderPhone;
  String destination;
  String location;
  String payment;
  int date;
  int year;
  int month;
  int timeInSeconds;

  String status;

  RideData(
      {this.documentId,
      this.recipient,
      this.riderName,
      this.amount,
      this.seat,
      this.pin,
      this.riderPhone,
      this.destination,
      this.location,
      this.date,
      this.year,
      this.month,
      this.payment,
      this.riderId,
      this.status,
      this.timeInSeconds});

  Map<String, dynamic> toMap() {
    return {
      'documentId': this.documentId,
      'recipient': this.recipient,
      'riderName': this.riderName,
      'amount': this.amount,
      'seat': this.seat,
      'pin': this.pin,
      'payment': this.payment,
      'riderPhone': this.riderPhone,
      'destination': this.destination,
      'location': this.location,
      'date': this.date,
      'year': this.year,
      'month': this.month,
      'timeInSeconds': this.timeInSeconds,
      'riderId': this.riderId,
      'status': this.status,
    };
  }

  factory RideData.fromMap(Map<String, dynamic> map) {
    return RideData(
        documentId: map['documentId'] as String,
        recipient: map['recipient'] as String,
        payment: map['payment'] as String,
        riderName: map['riderName'] as String,
        amount: map['amount']?.toDouble() as double,
        seat: map['seat'] as int,
        riderId: map['riderId'] as String,
        pin: map['pin'] as String,
        riderPhone: map['riderPhone'] as String,
        destination: map['destination'] as String,
        location: map['location'] as String,
        date: map['date'] as int,
        year: map['year'] as int,
        month: map['month'] as int,
        timeInSeconds: map['timeInSeconds'] as int,
        status: map['status'] as String);
  }
}
