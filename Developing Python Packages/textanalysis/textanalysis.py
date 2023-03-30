def count_words(filepath, words_list):
    """
    Count the number of words from word_list in the specified file.

    Parameters
    ----------
    filepath : str
        input file path
        
    words_list : list of str
        list of words to count in the file

    Returns
    -------
        total count of all words found in the file
    """
    with open(filepath) as file:
        text = file.read()

    n = 0
    for word in text.split():
        # Count the number of times the words in the list appear.
        if word.lower() in words_list:
            n += 1
    return n
