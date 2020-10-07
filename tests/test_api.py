"""Test api.py functionality."""
import pytest
from os.path import isfile

import pos
from pos.types import Dataset


def test_tagger(tagger, dictionaries):
    """Test all methods of the Tagger."""
    if not tagger or not dictionaries:
        pytest.skip("No --tagger or --dictionaries given")
    # Initialize the tagger
    tagger = pos.Tagger(
        model_file=tagger, dictionaries_file=dictionaries, device="cpu",
    )
    # Tag a single sentence
    tags = tagger.tag_sent(["Þetta", "er", "setning", "."])
    assert tags == ("fahen", "sfg3en", "nven", "pl")

    # Tag a correctly formatted file.
    dataset = Dataset.from_file("tests/test.tsv").unpack()[0]
    tags = tagger.tag_bulk(dataset=dataset)
    print(tags)
    assert tags == (("au",), ("fahen", "sfg3en", "nhen"), ("au", "aa"))
