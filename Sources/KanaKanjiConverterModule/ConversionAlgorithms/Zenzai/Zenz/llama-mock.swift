#if !Zenzai && !ZenzaiCPU
// Zenzaiが有効でない場合、このMock実装を有効化する
// These mock functions return safe dummy values to prevent crashes when Zenzai is disabled

package typealias llama_token = Int32
package typealias llama_pos = Int32
package typealias llama_seq_id = Int32

package struct llama_context_params {
    package var seed: Int
    package var n_ctx: Int
    package var n_threads: Int32
    package var n_threads_batch: Int32
    package var n_batch: Int
    package var offload_kqv: Bool
}
package func llama_context_default_params() -> llama_context_params {
    llama_context_params(seed: 0, n_ctx: 0, n_threads: 0, n_threads_batch: 0, n_batch: 0, offload_kqv: false)
}

package typealias llama_context = OpaquePointer
package func llama_init_from_model(_: llama_model, _: llama_context_params) -> llama_context? { nil }
package func llama_free(_: llama_context) {}

package typealias llama_model = OpaquePointer
package typealias llama_vocab = OpaquePointer

package func llama_model_free(_: llama_model) {}

package func llama_backend_init() {}
package func llama_backend_free() {}

package struct llama_model_params {
    package var use_mmap: Bool
    package var n_gpu_layers: Int32
    package var split_mode: Int32
}
package func llama_model_default_params() -> llama_model_params {
    llama_model_params(use_mmap: false, n_gpu_layers: 0, split_mode: 0)
}

package func llama_model_get_vocab(_: llama_model) -> llama_vocab? { nil }

package func llama_model_load_from_file(_: String, _: llama_model_params) -> llama_model? { nil }

package func llama_kv_cache_seq_rm(_: llama_context, _: llama_seq_id, _: llama_pos, _: llama_pos) {}
package func llama_kv_cache_seq_pos_max(_: llama_context, _: llama_seq_id) -> Int { 0 }

package struct llama_batch {
    package var token: [llama_token]
    package var pos: [llama_pos]
    package var n_seq_id: [llama_seq_id]
    package var seq_id: [[llama_seq_id]?]
    package var logits: UnsafeMutablePointer<Float>
    package var n_tokens: Int
}
package func llama_batch_init(_: Int, _: Int, _: Int) -> llama_batch {
    llama_batch(token: [], pos: [], n_seq_id: [], seq_id: [], logits: UnsafeMutablePointer<Float>.allocate(capacity: 1), n_tokens: 0)
}
package func llama_batch_free(_: llama_batch) {}

package func llama_n_ctx(_: llama_context) -> Int { 0 }
package func llama_vocab_n_tokens(_: llama_vocab) -> Int { 0 }

package func llama_tokenize(_: llama_model, _: String, _: Int32, _: UnsafeMutablePointer<llama_token>, _: Int32, _: Bool, _: Bool) -> Int { 0 }
package func llama_vocab_eos(_: llama_vocab) -> llama_token { 0 }
package func llama_vocab_bos(_: llama_vocab) -> llama_token { 0 }
package func llama_token_to_piece(_: llama_vocab, _: llama_token, _: UnsafeMutablePointer<Int8>, _: Int32, _: Int32, _: Bool) -> Int32 { 0 }

package func llama_decode(_: llama_context, _: llama_batch) -> Int { -1 }
package func llama_get_logits(_: llama_context) -> UnsafeMutablePointer<Float>? { nil }

// Constants for ZenzaiCPU mode
package let LLAMA_SPLIT_MODE_NONE: Int32 = 0
#endif
