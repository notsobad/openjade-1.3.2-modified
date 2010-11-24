#include "config.h"
#define OUTLINES
#ifdef SP_MANUAL_INST

#define SP_DEFINE_TEMPLATES
#include "Vector.h"
#undef SP_DEFINE_TEMPLATES

#ifdef DSSSL_NAMESPACE
namespace DSSSL_NAMESPACE {
#endif

__instantiate(Vector<TeXFOTBuilder::Format>)
__instantiate(Vector<TeXFOTBuilder::Row>)
__instantiate(Vector<TeXFOTBuilder::Cell>)
__instantiate(Vector<TeXFOTBuilder::Column>)
__instantiate(Vector<TeXFOTBuilder::TablePart>)
__instantiate(Vector<TeXFOTBuilder::Table>)
__instantiate(Vector<TeXFOTBuilder::FotElementState>)
__instantiate(Vector<OutputByteStream *>)
#ifdef OUTLINES
__instantiate(Vector<TeXFOTBuilder::ParHead>)
#endif
#ifdef DSSSL_NAMESPACE
}
#endif

#endif /* SP_MANUAL_INST */
