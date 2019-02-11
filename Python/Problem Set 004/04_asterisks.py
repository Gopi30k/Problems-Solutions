def recursive_pattern(n,k):
    if n<0:
        return
    recursive_pattern(n - 1, k + 1)
    for i in range(0,k):
        print (" "),
    for i in range(0,n):
        print ("* "),
    print ("\n"),


def non_recursive_pattern(n):
    size = n
    m = (2 * size) - 2
    for i in range(0, size):
        for j in range(0, m):
            print(''),

        m = m - 1  # decrementing m after each loop
        for j in range(0, i + 1):
            # printing full Triangle pyramid using stars
            print("* "),
        print(" ")
recursive_pattern(7,0)
non_recursive_pattern(7)

