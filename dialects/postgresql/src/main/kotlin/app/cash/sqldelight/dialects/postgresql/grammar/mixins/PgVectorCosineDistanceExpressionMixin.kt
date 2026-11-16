package app.cash.sqldelight.dialects.postgresql.grammar.mixins

import com.alecstrong.sql.psi.core.psi.SqlCompositeElementImpl
import com.alecstrong.sql.psi.core.psi.SqlExpr
import com.intellij.lang.ASTNode

/**
 * brain fork: pgvector's cosine distance operator `<=>`. The shared core
 * lexer has no `<=>` token, so the parser consumes the two-token sequence
 * LTE GT; the rendered SQL keeps the original `<=>` spelling byte-faithful.
 */
internal abstract class PgVectorCosineDistanceExpressionMixin(
  node: ASTNode,
) : SqlCompositeElementImpl(node),
  SqlExpr {
  val left: SqlExpr get() = children.filterIsInstance<SqlExpr>().first()
  val right: SqlExpr get() = children.filterIsInstance<SqlExpr>().last()
}
