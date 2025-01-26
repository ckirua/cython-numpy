if __name__ == "__main__":
    import numpy as np

    # from cround.clip import compute
    from cnpy import compute

    def example_clip():
        # Create sample input arrays
        array1 = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]], dtype=np.int32)

        array2 = np.array([[9, 8, 7], [6, 5, 4], [3, 2, 1]], dtype=np.int32)

        # Parameters for computation
        a = 2  # Multiplier for array1
        b = 3  # Multiplier for array2
        c = 1  # Constant to add

        # Compute result
        # Note: array1 values will be clipped to range [2,10] before computation
        result = compute(array1, array2, a, b, c)

        return result

    print(example_clip())
