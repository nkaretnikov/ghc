typedef unsigned int    tcflag_t;
typedef unsigned char   cc_t;

#define NCCS 32
struct termios
{
  tcflag_t c_iflag;      /* input modes */
  tcflag_t c_oflag;      /* output modes */
  tcflag_t c_cflag;      /* control modes */
  tcflag_t c_lflag;      /* local modes */
  cc_t     c_cc[NCCS];   /* special characters */
};

int tcsetattr(int fd, int optional_actions,
              const struct termios *termios_p);

#define TCSANOW 0
