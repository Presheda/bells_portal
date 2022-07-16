import 'package:bells_portal/widgets/export_widgets.dart';



/// this displays actions buttons for the ongoing call
///  the buttons are
///  (1) end call
///  (2) mute microphone
///  (3) put it on speaker
class OngoingCallActionButtons extends StatelessWidget {
  final bool isOnSpeaker;
  final bool isMuted;

  final Function endCall;
  final Function muteCall;
  final Function onSpeaker;

  OngoingCallActionButtons(
      {this.endCall,
      this.muteCall,
      this.onSpeaker,
      this.isOnSpeaker,
      this.isMuted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical : 20
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: muteCall,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: getIsMuted()
                  ? Theme.of(context).errorColor
                  : Theme.of(context).accentColor,
              child: Icon(
                  getIsMuted()
                      ? FontAwesome.microphone_slash
                      : FontAwesome.microphone,
                  size: 28,
                  color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: onSpeaker,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: getIsOnSpeaker()
                  ? Theme.of(context).errorColor
                  : Theme.of(context).accentColor,
              child: Icon(FontAwesome.volume_up, size: 28, color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: endCall,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).errorColor,
              child: Icon(FontAwesome.phone, size: 28, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  bool getIsMuted() {
    return isMuted != null && isMuted;
  }

  bool getIsOnSpeaker() {
    return isOnSpeaker != null && isOnSpeaker;
  }
}

/// this displays actions buttons for an incoming call that has not been accepted
///  the buttons are
///  (1) end call
///  (2) accept call
class IncomingCallActionButtons extends StatelessWidget {
  final Function endCall;
  final Function acceptCall;

  IncomingCallActionButtons({
    this.endCall,
    this.acceptCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical : 20
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          GestureDetector(
            onTap: endCall,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Theme.of(context).errorColor,
              child: Icon(FontAwesome.phone, size: 28, color: Colors.white),
            ),
          ),

          GestureDetector(
            onTap: acceptCall,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(FontAwesome.phone, size: 28, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
