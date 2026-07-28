import numpy as np

def get_matrix(name):
    rows = int(input(f"Enter number of rows for {name}: "))
    cols = int(input(f"Enter number of columns for {name}: "))
    print(f"Enter elements for {name} (row-wise):")
    elements = []
    for i in range(rows):
        row = list(map(float, input(f"Row {i+1}: ").split()))
        if len(row) != cols:
            print("Incorrect number of elements. Try again.")
            return get_matrix(name)
        elements.append(row)
    return np.array(elements)

def main():
    print("MATRIX CALCULATOR (using NumPy)")
    print("1. Add Matrices")
    print("2. Subtract Matrices")
    print("3. Multiply Matrices")
    print("4. Transpose Matrix")
    
    choice = input("Choose operation (1–4): ")

    if choice in ['1', '2', '3']:
        A = get_matrix("Matrix A")
        B = get_matrix("Matrix B")

        if A.shape != B.shape and choice != '3':
            print("Matrices must be the same size for addition/subtraction.")
            return

        if choice == '1':
            print("\nResult (A + B):")
            print(A + B)

        elif choice == '2':
            print("\nResult (A - B):")
            print(A - B)

        elif choice == '3':
            try:
                print("\nResult (A x B):")
                print(np.dot(A, B))
            except ValueError:
                print("Matrix multiplication is not possible with these dimensions.")
    
    elif choice == '4':
        A = get_matrix("Matrix A")
        print("\nTranspose of Matrix A:")
        print(A.T)

    else:
        print("Invalid choice. Please run again.")

if __name__ == "__main__":
    main()
