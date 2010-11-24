#ifdef SP_NAMESPACE
namespace SP_NAMESPACE {
#endif


#ifdef SP_NAMESPACE
}
#endif
#include "config.h"
#define OUTLINES
#ifdef SP_MANUAL_INST

#define SP_DEFINE_TEMPLATES
#include "Vector.h"
#undef SP_DEFINE_TEMPLATES

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::Format>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::Format>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::Format>;
#else
typedef Vector<TeXFOTBuilder::Format> Dummy_0;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::Row>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::Row>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::Row>;
#else
typedef Vector<TeXFOTBuilder::Row> Dummy_1;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::Cell>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::Cell>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::Cell>;
#else
typedef Vector<TeXFOTBuilder::Cell> Dummy_2;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::Column>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::Column>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::Column>;
#else
typedef Vector<TeXFOTBuilder::Column> Dummy_3;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::TablePart>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::TablePart>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::TablePart>;
#else
typedef Vector<TeXFOTBuilder::TablePart> Dummy_4;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::Table>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::Table>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::Table>;
#else
typedef Vector<TeXFOTBuilder::Table> Dummy_5;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::FotElementState>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::FotElementState>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::FotElementState>;
#else
typedef Vector<TeXFOTBuilder::FotElementState> Dummy_6;
#endif
#endif
#endif
#ifdef __DECCXX
#pragma define_template Vector<OutputByteStream *>
#else
#ifdef __xlC__
#pragma define(Vector<OutputByteStream *>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<OutputByteStream *>;
#else
typedef Vector<OutputByteStream *> Dummy_7;
#endif
#endif
#endif
#ifdef OUTLINES
#ifdef __DECCXX
#pragma define_template Vector<TeXFOTBuilder::ParHead>
#else
#ifdef __xlC__
#pragma define(Vector<TeXFOTBuilder::ParHead>)
#else
#ifdef SP_ANSI_CLASS_INST
template class Vector<TeXFOTBuilder::ParHead>;
#else
typedef Vector<TeXFOTBuilder::ParHead> Dummy_8;
#endif
#endif
#endif
#endif
#ifdef DSSSL_NAMESPACE
}
#endif

#endif /* SP_MANUAL_INST */
