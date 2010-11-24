// This file was automatically generated from DssslAppMessages.msg by msggen.pl.
#include <OpenSP/Message.h>

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

struct DssslAppMessages {
  // 2000
  static const MessageType2 versionInfo;
  // 2001
  static const MessageType0 noSpec;
};
extern MessageModule jstyleModule;

const MessageType2 DssslAppMessages::versionInfo(
MessageType::info,
&jstyleModule,
2000
#ifndef SP_NO_MESSAGE_TEXT
,"%1 version %2"
#endif
);
const MessageType0 DssslAppMessages::noSpec(
MessageType::error,
&jstyleModule,
2001
#ifndef SP_NO_MESSAGE_TEXT
,"no DSSSL specification: use -d to specify"
#endif
);
#ifdef SP_NAMESPACE
}
#endif
