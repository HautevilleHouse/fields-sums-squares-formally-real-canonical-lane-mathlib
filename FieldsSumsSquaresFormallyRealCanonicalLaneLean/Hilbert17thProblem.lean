import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FieldsSumsSquaresFormallyRealCanonicalLaneLean

structure Hilbert17thPackage (F : FormallyRealField) where
  rationalFunction : F.carrier → F.carrier
  sosRepresentation : SumOfSquaresStructure F
  representation : ∀ x : F.carrier, x ∈ F.positiveCone → rationalFunction x ∈ sosRepresentation.sosSet

structure Hilbert17thEvidence {F : FormallyRealField} (H : Hilbert17thPackage F) where
  representationClosed : ∀ x : F.carrier, x ∈ F.positiveCone → H.rationalFunction x ∈ H.sosRepresentation.sosSet

end FieldsSumsSquaresFormallyRealCanonicalLaneLean
end HautevilleHouse