class TradPacket {
  String sid;
  String seg;
  double ltp;
  TradPacket(this.sid, this.seg, this.ltp);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TradPacket &&
      other.sid == sid &&
      other.seg == seg &&
      other.ltp == ltp;
  }

  @override
  int get hashCode => sid.hashCode ^ seg.hashCode ^ ltp.hashCode;
}
