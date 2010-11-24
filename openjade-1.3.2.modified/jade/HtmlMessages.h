// This file was automatically generated from HtmlMessages.msg by msggen.pl.
#include <OpenSP/Message.h>

#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif

struct HtmlMessages {
  // 3000
  static const MessageType2 cannotOpenOutputError;
};
extern MessageModule jstyleModule;

const MessageType2 HtmlMessages::cannotOpenOutputError(
MessageType::error,
&jstyleModule,
3000
#ifndef SP_NO_MESSAGE_TEXT
,"cannot open output file %1 (%2)"
#endif
);
#ifdef SP_NAMESPACE
}
#endif
