#include_next <termios.h>

#define IGNBRK  0000001
#define BRKINT  0000002
#define IGNPAR	0000004
#define PARMRK	0000010
#define INPCK	0000020
#define ISTRIP	0000040
#define INLCR	0000100
#define IGNCR	0000200
#define ICRNL   0000400
#define IXON	0002000
#define IXOFF	0010000

#define CSTOPB	0000100
#define CREAD	0000200
#define PARENB	0000400
#define PARODD	0001000
#define HUPCL	0002000
#define CLOCAL	0004000

#define ISIG	0000001
#define ICANON	0000002
#define IEXTEN	0100000

#define ECHO	0000010
#define ECHOE	0000020
#define ECHOK	0000040
#define ECHONL	0000100
#define NOFLSH	0000200
#define TOSTOP	0000400

#define CSIZE	0000060
#define   CS5	0000000
#define   CS6	0000020
#define   CS7	0000040
#define   CS8	0000060

#define     _POSIX_VDISABLE '\0'

#define VINTR 0
#define VQUIT 1
#define VERASE 2
#define VKILL 3
#define VEOF 4
#define VTIME 5
#define VMIN 6
#define VSTART 8
#define VSTOP 9
#define VSUSP 10
#define VEOL 11

#define	TCOOFF		0
#define	TCOON		1
#define	TCIOFF		2
#define	TCION		3

#define	TCSADRAIN	1
#define	TCSAFLUSH	2

#define	TCIFLUSH	0
#define	TCOFLUSH	1
#define	TCIOFLUSH	2

#define OPOST	0000001

#define  B0	0000000
#define  B50	0000001
#define  B75	0000002
#define  B110	0000003
#define  B134	0000004
#define  B150	0000005
#define  B200	0000006
#define  B300	0000007
#define  B600	0000010
#define  B1200	0000011
#define  B1800	0000012
#define  B2400	0000013
#define  B4800	0000014
#define  B9600	0000015
#define  B19200	0000016
#define  B38400	0000017
#define  B57600   0010001
#define  B115200  0010002
