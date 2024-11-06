
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, Dense, LSTM, GRU, GlobalMaxPooling1D
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

# Paramètres
vocab_size = 10000
embedding_dim = 16
max_length = 100
trunc_type = 'post'
padding_type = 'post'
oov_tok = "<OOV>"

# Exemple de données
sentences = [
    'Je suis très heureux',
    'Ceci est un exemple de texte',
    'Le modèle de réseau de neurones est intéressant',
    'Nous aimons apprendre le deep learning'
]
labels = [1, 0, 1, 1]

# Prétraitement des données
tokenizer = Tokenizer(num_words=vocab_size, oov_token=oov_tok)
tokenizer.fit_on_texts(sentences)
word_index = tokenizer.word_index
sequences = tokenizer.texts_to_sequences(sentences)
padded = pad_sequences(sequences, maxlen=max_length, padding=padding_type, truncating=trunc_type)

# Construction du modèle
model = Sequential([
    Embedding(vocab_size, embedding_dim, input_length=max_length),
    GlobalMaxPooling1D(),
    Dense(24, activation='relu'),
    Dense(1, activation='sigmoid')
])

# Compilation du modèle
model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

# Affichage du résumé du modèle
model.summary()

# Entraînement du modèle (à titre d'exemple, les données sont petites)
model.fit(padded, labels, epochs=10)
