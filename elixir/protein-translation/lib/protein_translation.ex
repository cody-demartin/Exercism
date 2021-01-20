defmodule ProteinTranslation do
  @methionine "AUG"
  @phenylalanine ["UUC", "UUU"]
  @leucine ["UUA", "UUG"]
  @serine ["UCU", "UCC", "UCA", "UCG"]
  @tyrosine ["UAU", "UAC"]
  @cysteine ["UGU", "UGC"]
  @tryptophan "UGG"
  @terminating ["UAA", "UAG", "UGA"]
  @stop "STOP"
  @codon_length ~r/.{3}/



  # some stuff

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna
    |> String.split(~r/.{3}/, include_captures: true, trim: true)
    |> Enum.map(fn x ->
      result = of_codon(x)
      if result === "STOP" do

      end
    end)
    #map over the new chunks and pass the return value of of_codon back as we map

  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    Map.get(@proteins, codon)
  end
end
