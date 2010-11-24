// This file was automatically generated from JadeMessages.msg by msggen.pl.
#include <OpenSP/Message.h>

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

struct JadeMessages {
  // 1000
  static const MessageType1 unknownType;
  // 1001
  static const MessageType0 emptyOutputFilename;
  // 1002
  static const MessageType2 cannotOpenOutputError;
};
extern MessageModule jstyleModule;

const MessageType1 JadeMessages::unknownType(
MessageType::error,
&jstyleModule,
1000
#ifndef SP_NO_MESSAGE_TEXT
,"unknown output type %1"
#endif
);
const MessageType0 JadeMessages::emptyOutputFilename(
MessageType::error,
&jstyleModule,
1001
#ifndef SP_NO_MESSAGE_TEXT
,"empty output filename"
#endif
);
const MessageType2 JadeMessages::cannotOpenOutputError(
MessageType::error,
&jstyleModule,
1002
#ifndef SP_NO_MESSAGE_TEXT
,"cannot open output file %1 (%2)"
#endif
);
#ifdef SP_NAMESPACE
}
#endif
