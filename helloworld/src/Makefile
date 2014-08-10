target = helloworld
SOURCES = helloworld.c
OBJS := $(SOURCES:%.c=%.o)

# TARGET_LDFLAGS += --static -lssl

RED = \e[1;31m
NC = \e[0m

.c.o:
	$(CC) -c $^ -o $@


$(target): $(OBJS)
	$(CC) $(TARGET_CFLAGS) $^ $(TARGET_LDFLAGS) -o $@
	@ echo -e "${RED}make done${NC}"

.PHONY:
clean:
	rm *.o helloworld
	@echo "${RED}clean done${NC}"
