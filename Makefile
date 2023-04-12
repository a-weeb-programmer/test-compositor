CFLAGS = -O2 -Wall -Wextra
SRCDIR = ./src
BUILDDIR = ./build
OBJDIR = $(BUILDDIR)/objs
EXECDIR = $(BUILDDIR)
EXECNAME = $(EXECDIR)/test-compositor
vpath %.c $(SRCDIR)
vpath %.h $(SRCDIR)

SRCFILES = main.c
OBJFILES = $(SRCFILES:%.c=$(OBJDIR)/%.o)

all: $(EXECNAME)

$(EXECNAME): $(OBJFILES) | $(EXECDIR)
	$(CC) $(OBJFILES) -o $@

$(EXECDIR) $(OBJDIR):
	mkdir -p $@

$(OBJDIR)/%.o: %.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJFILES) $(EXECNAME)

deepclean:
	rm -rf $(BUILDDIR)

.PHONY: all clean deepclean
